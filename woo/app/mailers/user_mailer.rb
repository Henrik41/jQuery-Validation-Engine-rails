class UserMailer < ActionMailer::Base
  default :from => "admin@woomatch.com", content_type: 'multipart/mixed', parts_order: [ "text/html", "text/enriched", "text/plain", "application/pdf" ]
  
  def send_user_accepted(user,activity,current_user)
     @activity = activity
     @current_user = current_user
     mail(:to => user.email, 
          :subject => "Woomatch! You just got accepted!",
       
          :template_path => 'user_mailer',    
          :template_name => 'send_user_accepted'  
          ) 
  end
  
  def followme(current_user,user,activity)
    @current_user = current_user
    @activity = activity
    @username = user

     mail(:to => user.email, 
          :subject => "Woomatch! Someone is follow your activity!",
             
          :template_path => 'user_mailer',    
          :template_name => 'followme'  
              )
  end
  
  def userfollowme(user,userfollowingu)
     @thecurrentuser = user
     mail(:to => userfollowingu.email, 
          :subject => "Woomatch! Someone is follow you!",
        
          :template_path => 'user_mailer',    
          :template_name => 'userfollowme'  
              )
    
  end
  
  def partime(current_user,user,activity)
    @current_user = current_user
    @activity = activity
    @username = user

     mail(:to => user.email, 
          :subject => "Woomatch! Someone wants to participate to your activity!",
             
          :template_path => 'user_mailer',    
          :template_name => 'partime'  
              )
  end
  
  def activitymod(current_user,user,activity)
    @current_user = current_user
    @activity = activity
    @username = user
  
      mail(:to => user.email, 
            :subject => "Someone change it's activity on Woomatch!",

            :template_path => 'user_mailer',    
            :template_name => 'activitymod'  
                )
    end
    
    def usernearme(current_user,user)
      @current_user = current_user
      @username = user

        mail(:to => user.email, 
              :subject => "Someone near you just registered on Woomatch!",

              :template_path => 'user_mailer',    
              :template_name => 'usernearme'  
                  )
      end
    
   

end