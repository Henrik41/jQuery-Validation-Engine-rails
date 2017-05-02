class ContactController < ApplicationController
  
  def new
     @contact = Contact.new
   end

   def create
     x=params[:contact]
     @contact = Contact.new(x)

     if @contact.valid?
       NotificationsMailer.new_message(@contact).deliver
       redirect_to(root_path, :notice => "Message was successfully sent.")
     else
       flash.now.alert = "Please fill all fields."
       render :new
     end
   end
   
   def alerte
     @contact = Contact.new(
     :name => params[:id],
     :email => 'henri@woomatch.com',
     :body => 'You received an email from '+User.find(params[:id]).name+'. The activity id='+params[:activity]+' is suspicious',     
     
     )
     
      NotificationsMailer.new_message(@contact).deliver
      
        respond_to do |format|
             format.js { render :js => "window.location = '/start/dashboard/2'" }
         end
      

   end
   
end
