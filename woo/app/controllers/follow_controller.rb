class FollowController < ApplicationController
  def ifollow
    @userfollowing = current_user.following_by_type('User')
    @userfollowingme = current_user.followers    
    @activityfollowing = current_user.following_by_type('Activity')
 
    @user = current_user
    @loc = @user.location


    
        if NearestTimeZone.to(@user.latitude,@user.longitude)
          @mytime = NearestTimeZone.to(@user.latitude,@user.longitude)
          @timenow = Time.now.in_time_zone(@mytime)
        else
          @timenow = Time.now
        end

  end
  
  def list
 
    @activities = Activity.where("title like ?", "%#{params[:term]}%").last(8)
  
      respond_to do |format|
        format.html
        format.json{render :json => @activities.as_json(only: [:title, :about], methods: [:avatar_url])}
      end
  end
  
end
