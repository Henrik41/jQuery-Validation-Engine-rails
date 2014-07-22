class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable


   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :validatable, :email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :activities, :dependent => :destroy
  has_many :userinterests, :dependent => :destroy
  has_one :visit, :as => :visitable, :dependent => :destroy
  accepts_nested_attributes_for :userinterests, 
                                    :allow_destroy => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :location, :realage, :dob, :age, :sex, :status, :about, :web, :email, :password, :password_confirmation, :time_zone, :avatar, :remote_avatar_url, :userinterests_attributes
  attr_accessible :longitude, :latitude
  attr_accessible :provider, :uid, :name, :completion, :nomail, :followme, :userfollowme, :acceptme, :partime
  attr_accessible :body, :conversation_id
 
  geocoded_by :location
  mount_uploader :avatar, AvatarUploader
   acts_as_messageable
     acts_as_followable
     acts_as_follower
      acts_as_voter
       acts_as_votable
       
  validates_presence_of  :username
  validates_length_of :username, :minimum => 1, :maximum => 40
  validates_length_of :about, :minimum => 0, :maximum => 300, :allow_blank => true
  validates_length_of :web, :minimum => 0, :maximum => 45, :allow_blank => true
    
  after_validation :geocode, :if => :location_changed?
  
  scope :online, lambda{ where("updated_at > ?", 1000.minutes.ago) }
  
PROFILE_COMPLETENESS = %w[username dob location status about web]
  
  def age
      now = Time.now.utc.to_date
      if dob 
      now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
    else
    end
  end
  
  def completion
    progression = 0
    PROFILE_COMPLETENESS.each do |c|
      if !self.attributes[c].blank?
        progression += 1 
      else
      end      
    end
     progression
     if !self.userinterests.empty? 
       progression += 1
     else
     end
     
     if !self.avatar.to_s.include? "blank.jpg"
        progression += 1
      else
      end
            
      progression*100/8
  end



  def name
     username
   end
  
   def mailboxer_email(object)
     #Check if an email should be sent for that object
     #if true
     return "define_email@on_your.model"
     #if false
     #return nil
   end
   

   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
       user = User.where(:provider => auth.provider, :uid => auth.uid).first
       if user
         return user
       else
         registered_user = User.where(:email => auth.info.email).first
         if registered_user
           return registered_user
         else
         active = true       
         emptyst= "".to_s  
         user = User.create!( username:auth.extra.raw_info.first_name,
                                email:auth.info.email,
                                remote_avatar_url:auth.info.image.gsub('http://','https://').to_s.split("?")[0]+"?type=large",
                                location:auth.info.location,  
                                sex:auth.extra.raw_info.gender,
                                uid:auth.uid,   
                                about:emptyst,
                                nomail:active,
                                followme: active,
                                userfollowme:active,
                                acceptme:active,
                                partime:active,
                                dob:Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y'),                        
                                password:Devise.friendly_token[0,20]
             )
         
           
         end    end
    
     end
   
   def self.new_with_session(params, session)
       super.tap do |user|
         if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
           user.email = data["email"] if user.email.blank?
         end
       end
     end
   
     def online?
       updated_at > 1000.minutes.ago
     end
     
     def mailboxer_email(message)
         if self.nomail
             email
         else
              nil
         end
     end
     
end
