class SearchController < ApplicationController
  
  

  def searchactivities
     @user = current_user if current_user
     
     param = params[:search]
     @searchs = Activity.where("title like ?", "%#{param}%" ).last(8)
    
     @result = request.location        
     mytimezone = NearestTimeZone.to(@result.latitude,@result.longitude)
     
      Time.zone = mytimezone
      @mytime = Time.zone.now

       @loc =  @result.data['city'].to_s + ', ' + @result.data['region_name'].to_s
    respond_to do |format|    
      format.html {}
                
  end
  end
  
  def searchbycity
    @param = params[:q]
    mycoord = Geocoder.coordinates(@param)
    @activity = Activity.near(@param,150).order("updated_at").first(4)
    @loc = @param
    
    mytimezone = NearestTimeZone.to(mycoord[0],mycoord[1])
    Time.zone = mytimezone
    @mytime = Time.zone.now
    
    if  @activity.empty?
        if request.location.nil?
          @loc = 'Paris, Ile de france'  
          @activity = Activity.last(4)
          @mytime = Time.now

        else
          @result = request.location 
          @loc = @result.data['city'].to_s + ', ' + @result.data['region_name'].to_s + ', ' + @result.data['country_name'].to_s                 
          
          mytimezone = NearestTimeZone.to(@result.latitude,@result.longitude)
          @activity = Activity.near(@loc,100).order("updated_at").last(4)

        end
    end
      respond_to do |format|    
        format.js {}
      end
    
    
  end
  
  def activitysearch
       
    @user = current_user   
    mytimezone = NearestTimeZone.to(@user.latitude,@user.longitude)
    Time.zone = mytimezone
    @mytime = Time.zone.now
    
     if params[:location].present?
       @search1 = Activity.joins(:visit).order('total_visits DESC').near(params[:location],80).order("distance").ransack(params[:q])      
       @activities1 = @search1.result(distinct: true)
       
       
       @search2 = Activity.near([@user.latitude,@user.longitude],400).order('updated_at DESC').order("distance").ransack(params[:q])
        @activities2 = @search2.result(distinct: true)
       
        @search = Activity.order('updated_at DESC').near(params[:location],120).ransack(params[:q])
        @activities = @search.result(distinct: true)
       
       
       @activitiesrecent =  @activities.page(params[:page]).per(8)
       @activitiesnear   =  @activities2.page(params[:page]).per(8)
       
       
       @activitiespop    =  @activities1.page(params[:page]).per(8)

     else
       @search = Activity.ransack(params[:q])
       @activities = @search.result(distinct: true)
       
       @activitiesrecent =  @activities.order('updated_at DESC').page(params[:page]).per(8)
       @activitiesnear   =  @activities.order('updated_at DESC').near([@user.latitude,@user.longitude],100).order("distance").page(params[:page]).per(8)
       @activitiespop    =  @activities.joins(:visit).order('total_visits DESC').joins(:visit).page(params[:page]).per(8)
       
     end
      
      
         

    @loc = current_user.location
    @people = User.near([@user.latitude,@user.longitude], 150).last(9)
    
    

  end
  
  def peoplesearch
   
      @result = request.location        
      @mytimezone = NearestTimeZone.to(@result.latitude,@result.longitude)
  
      @param = params[:q]
       @loc = @param
     if request.location == nil
      @people = User.find(:all).last(10)
     else
      @people = User.near(@param).order("updated_at DESC").order("distance").page(params[:page]).per(8)
     end 
     

  respond_to do |format|    
    format.html {}
  end
 end
  
end
