class InfoController < ApplicationController
  def my_activity
     @activity = Activity.find(params[:id])
      @user = User.find(@activity.user_id)
      @mytime = Time.now
      @useractivity = @user
      @whos_following = @activity.followers
  end
  
end
