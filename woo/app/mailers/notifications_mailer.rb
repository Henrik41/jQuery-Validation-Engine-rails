class NotificationsMailer < ActionMailer::Base

  default :from => "admin@woomatch.com"
  default :to => "henrik41@hotmail.com"

  def new_message(contact)
    @contact = contact
    mail(:subject => "Woomatch-email #{message.subject}")
  end
  


end
