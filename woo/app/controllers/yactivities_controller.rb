class YactivitiesController < InheritedResources::Base
  
  before_filter :get_location, :get_time
   
  
  def home    
    
      @activitynow  = Kaminari.paginate_array(Interestanswer.where(:answer => true).reverse).page(params[:page]).per(9)
   
           
      @user = current_user
      if @user.location.nil? || @user.location.blank?
        @user.location = @loc
        @user.save
      end
      @selected_activities = Activity.find(:all, :order => "id desc", :limit => 24).reverse
     
      @allfollow = @user.following_by_type('Activity') 
      @myact =  @user.activities    
      @activityall = Activity.near([current_user.latitude,current_user.longitude],200)
      @act = @activityall - @allfollow - @myact
    
      if   @act.sample.nil?
        params[:id] = "1"
      else
      @activities = @act.sample
      end
 
      
      
      
      
    @peoplevisitingme = Visit.where(:visitable_id => current_user, :visitable_type => "User")

      unless @peoplevisitingme[0].nil?

     @myvisitor = @peoplevisitingme[0].visit_details.pluck(:ip_address)
     @myvisit = User.find_all_by_id(@myvisitor).last(9)

      else

      @myvisit = []

      end
   
      userinteresttotal = Yactivity.find(:all).map {|r| r.id}
      userinterest = @user.interestanswers.find(:all).map {|r| r.yactivity_id}
      
      yactivitytotal = userinteresttotal - userinterest 
      @randomyactivity = yactivitytotal.sample
      
      if !@randomyactivity.nil? 
        
        @yactivities = Yactivity.find(@randomyactivity) 
    
      end
      
      
    
    
    @useronline = User.online.find(:all, :limit => 9)
    @loc = @user.location
    @interestcount = @user.userinterests.find(:all).count
    @activitiescount = @user.activities.where(:user_id => @user.id).count
    @completion = @user.completion 	
    
 
    public_destroy = PublicActivity::Activity.order('created_at DESC').limit(300).where(:key => "follow.destroy")
    public_array_all = PublicActivity::Activity.order('created_at DESC').limit(300)
    public_want_to_part =  PublicActivity::Activity.order('created_at DESC').where('events.key = ?', "wanto_participate").limit(100)
    public_accepted =  PublicActivity::Activity.order('created_at DESC').where('events.key = ?', "accepted").limit(100)
    
    public_array = (public_array_all - public_destroy - public_want_to_part - public_accepted).delete_if {|x| x.trackable == nil}
    @events = Kaminari.paginate_array(public_array).page(params[:page]).per(10) 
  end

  def yesbutton
     @user = current_user
     theid = params[:id]
     name = Yactivity.find(theid).name
     
     array1 = @user.interestanswers.find(:all).map {|r| r.yactivity_id}
     
     
     
       if array1.include?(theid.to_i)
          
       else
           @user.userinterests.create(:user_id => @user.id, :interest => name)
           @user.interestanswers.create(:user_id => @user.id, :answer => true, :name => name, :yactivity_id => theid)
       end
    redirect_to :controller => 'yactivities', :action => 'home'
  end
  
  def nobutton
    @user = current_user
    theid = params[:id]
    name = Yactivity.find(theid).name
    
    @user.interestanswers.create(:user_id => @user.id, :answer => false, :name => name, :yactivity_id => theid)
   
   redirect_to :controller => 'yactivities', :action => 'home'
  end
  
  def uservalide
  user = User.find_by_email(params[:user_email])
  if user.nil?
      texta = ["user_email",false,"This user doesn't exists"]
  else
       texta = ["user_email",true,""]
  end
    respond_to do |format|
    
      format.json { render :json => texta} # index.html.erb
    end
  end
private
  
  def get_location
    if request.location.nil? 

      @loc =  "Manhattan, New York, USA"
      @mytimezone = "America/New_York"
    else
      @result = request.location
      @loc = @result.data['city'].to_s + ', ' + @result.data['region_name'].to_s + ', ' + @result.data['country_name'].to_s                 
      @mytimezone = NearestTimeZone.to(@result.latitude,@result.longitude)
    end
    
  end
  
  def get_time   
    Time.zone = @mytimezone
    @mytime = Time.zone.now  
  end
  
  
end
