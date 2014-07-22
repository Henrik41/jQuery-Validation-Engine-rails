class StartController < ApplicationController
  
  before_filter :get_location, :get_time
   
  def index   
     @activity = Activity.near([@result.latitude,@result.longitude],200).find(:all, :conditions => ['ending >= ?', DateTime.now]).last(4)    
  end
  
  def dashboard        
    @user = current_user
      if @user.location.nil? || @user.location.blank?
        @user.location = @loc
        @user.save
      end
     
      @allfollow = @user.following_by_type('Activity') 
      @myact =  @user.activities    
      @activityall = Activity.near([current_user.latitude,current_user.longitude],200)
      @act = @activityall - @allfollow - @myact
    
      if   @act.sample.nil?
        params[:id] = "1"
      else
      @activities = @act.sample
    end
 
      

    @useronline = User.online.find(:all, :limit => 9)
    @loc = @user.location
    @interestcount = @user.userinterests.find(:all).count
    @activitiescount = @user.activities.where(:user_id => @user.id).count
    @completion = @user.completion 	
    public_destroy = PublicActivity::Activity.order('created_at DESC').limit(300).where(:key => "follow.destroy")
    public_array_all = PublicActivity::Activity.order('created_at DESC').limit(300)
    public_array = (public_array_all - public_destroy).delete_if {|x| x.trackable == nil}
    @events = Kaminari.paginate_array(public_array).page(params[:page]).per(5) 
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
