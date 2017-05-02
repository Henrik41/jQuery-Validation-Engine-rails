class GeneralController < ApplicationController
  def activity
    
    unless current_user.nil?
      mytimezone = NearestTimeZone.to(current_user.latitude,current_user.longitude)
      Time.zone = mytimezone
      @mytime = Time.zone.now

      @activity = Activity.find(params[:id])

      @user = User.find(@activity.user_id)
      @userparticipating2 = @activity.votes_for.where(:vote_scope => 'accept').map(&:voter).uniq
      @userparticipating = @activity.votes_for.where(:vote_scope => nil).map(&:voter)    

      @useractivity = @user
      @activity2 = Activity.find(params[:id])
      @whos_following = @activity.followers
      Visit.track(@activity,current_user)  
      
      @peoplevisitingme = Visit.where(:visitable_id => current_user, :visitable_type => "User")
    
       unless @peoplevisitingme[0].nil?
     
      @myvisitor = @peoplevisitingme[0].visit_details.pluck(:ip_address)
      @myvisit = User.find_all_by_id(@myvisitor).last(4)
      
       else
      
       @myvisit = nil
       
       end
    
    else

    
    redirect_to :controller => 'start', :action => 'index'
    end
    
    
  end

 def follow

 
     @activity = Activity.find(params[:id])
     @useraccepted = User.find(@activity.user_id)           
     @current_user2 = current_user
     
    if @useraccepted.followme
       UserMailer.followme(@current_user2,@useraccepted,@activity).deliver
    end
    
    current_user.follow(@activity)
    PublicActivity::Activity.last.update_attribute(:recipient_id, @useraccepted.id)
    
    
    respond_to do |format|
       format.js {}
    end
  end
  
  def unfollow
    @activity = Activity.find(params[:id])
    current_user.stop_following(@activity)
    PublicActivity::Activity.last.update_attribute(:notif, "off")
    
    respond_to do |format|
       format.js {}
    end
  end
  
  
  def follow2
    
    @activity2 = Activity.find(params[:id])
    @activity2.liked_by current_user
    
    @current_user2 = current_user
    @useraccepted = User.find(@activity2.user_id) 
    @activity2.create_activity key: 'wanto_participate', owner: current_user,  notif: 'on'
    
    if @useraccepted.partime
       UserMailer.partime(@current_user2,@useraccepted,@activity2).deliver
    end
    
    respond_to do |format|
       format.js {}
    end
  end
  
  def unfollow2
      @activity2 = Activity.find(params[:id])
      @activity2.unliked_by current_user
      @activity2.unliked_by current_user, :vote_scope => 'accept'
        PublicActivity::Activity.last.update_attribute(:notif, "off")
      
      respond_to do |format|
         format.js {}
      end
    
  end
  
  def follow3
    @useraccepted = User.find(params[:id])       
    @activity2 = Activity.find(params[:activity])
    @current_user2 = current_user
    if @useraccepted.acceptme
       UserMailer.send_user_accepted(@useraccepted,@activity2,@current_user2).deliver
    end
    
    @votes = @activity2.find_votes_for.where(:voter_id => @useraccepted)
    
    @userparticipating = @activity2.votes_for.where(:vote_scope => nil).map(&:voter)
   
    
    if @votes.empty?
    else

    @votes[0].vote_scope = 'accept'
    @votes[0].save
 
    end
    
    @activity2.create_activity key: 'accepted', owner: current_user,  notif: 'on'
    PublicActivity::Activity.last.update_attribute(:recipient_id, @useraccepted.id)
    
    
    respond_to do |format|
        format.js {}
    end
    
  end
  
  def follow4
     @useraccepted = User.find(params[:id])
     @activity2 = Activity.find(params[:activity])
     @votes = @activity2.votes_for.where(:voter_id => @useraccepted)
     
     if @votes.empty?
     else
       @votes.each do |v|
         v.vote_scope = nil
         v.save
       end
     end
     
     @activity2.unliked_by @useraccepted
        
     
  end
  
  
  def followdash
       @activity = Activity.find(params[:id])
       @useraccepted = User.find(@activity.user_id)           
       @current_user2 = current_user
       
       
      if @useraccepted.followme
         UserMailer.followme(@current_user2,@useraccepted,@activity).deliver
      end

      
      current_user.follow(@activity)
      
      respond_to do |format|
         format.js {}
      end
   
  end
  
  def unfollow3
    @useraccepted = User.find(params[:id])
    @activity2 = Activity.find(params[:activity])
    @activity2.unliked_by @useraccepted
      PublicActivity::Activity.last.update_attribute(:notif, "off")
    
    
    respond_to do |format|
        format.js {}
    end
  end
  
  def followall
    @activity = Activity.find(params[:id])
    @userparticipating = @activity.votes_for.where(:vote_scope => nil).map(&:voter)
    @activity2 = @activity
    @current_user2 = current_user  
    @userparticipating.each do |c|
        @votes = @activity.votes_for.where(:voter_id => c.id)
         UserMailer.send_user_accepted(c,@activity2,@current_user2).deliver
      if @votes.empty?
       else
         @votes.each do |v|
           v.vote_scope = 'accept'
           v.save
         end
       end
       
    end
    
    respond_to do |format|
         format.js {}
     end
     
  end
  
  def invite
    
    @activity = Activity.find(params[:id])
    @useraccepted = User.find(@activity.user_id)
    @para1= 'Hey It\'s me '+@useraccepted.username+'. You are invited to my activity <b>'+'<a href="http://woomatch.com/activity/'+@activity.id.to_s+'">'+ @activity.title+'</a></b>. Please check it out and let me know what you think! </br> </br>'+'<a href="http://woomatch.com/activity/'+@activity.id.to_s+'">'+'<img src="'+@activity.avatar.url(:supermini)+'"></a>'
     @following = params[:role_ids]
     @following.each do |f|
       
      @user_receiver = User.find(f)
      
       conv_check_1 = Conversation.participant(@user_receiver)
       conv_check_2 = Conversation.participant(current_user)

       @dialog = (conv_check_1 & conv_check_2).first

       if @dialog.nil? or !@dialog.is_participant?(current_user)
          current_user.send_message(@user_receiver, @para1, 'VIP Invitation')
       else
          current_user.reply_to_conversation(@dialog, @para1)
       end
       
       
     end
     respond_to do |format|
          format.html {}
      end   
     
  end
  
  def notification
    
    @Private_activity_one = PublicActivity::Activity.order('created_at DESC').where("events.recipient_id = ? AND events.owner_type = 'User' AND events.key = 'wanto_participate' AND events.notif = 'on'", current_user)
   
    @Private_activity_two = PublicActivity::Activity.order('created_at DESC').where("events.recipient_id = ? AND trackable_type = 'Follow' AND notif = 'on'", current_user)
    
    @Private_activity_three =  PublicActivity::Activity.order('created_at DESC').where("events.recipient_id = ? AND owner_type = 'User' AND events.key = 'accepted' AND notif = 'on'", current_user)
     
    @Private_total =  @Private_activity_one +  @Private_activity_two + @Private_activity_three
#    @notif = Notif.last(6)

    @notif =   @Private_total.sort_by{ |a| a[:id] }.reverse.delete_if {|x| x.trackable == nil}
    
    
    
    
    respond_to do |format|
         format.js { render "notifalert", :locals => {:notifi => @notif} }
     end
  end
  
  def deletenotif
    @public_id = params[:id]
    @notif_reset = PublicActivity::Activity.find(@public_id).update_attribute(:notif, "off")
    
        @Private_activity_one = PublicActivity::Activity.order('created_at DESC').where("events.recipient_id = ? AND owner_type = 'User' AND events.key = 'wanto_participate' AND notif = 'on'", current_user)

        @Private_activity_two = PublicActivity::Activity.order('created_at DESC').where("events.recipient_id = ? AND trackable_type = 'Follow' AND notif = 'on'", current_user)

        @Private_activity_three =  PublicActivity::Activity.order('created_at DESC').where("events.recipient_id = ? AND owner_type = 'User' AND events.key = 'accepted' AND notif = 'on'", current_user)

        @Private_total =  @Private_activity_one +  @Private_activity_two + @Private_activity_three
    #    @notif = Notif.last(6)

        @notif =   @Private_total.sort_by{ |a| a[:id] }.reverse.delete_if {|x| x.trackable == nil}
        
    respond_to do |format|
       format.js { render "notifalert", :locals => {:notifi => @notif} }
    end  
    
  end
  
  def newsletter
    @email = params[:email]
    respond_to do |format|
         format.js {}
     end
     
  end
  

  
  end