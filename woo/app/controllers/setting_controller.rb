class SettingController < ApplicationController
  def index
    @user=current_user
    @contact = Contact.new
  end
  

  
  
  def update
    @user = current_user
     respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to '/yactivities/home', notice: 'Profile was successfully updated.' }
          format.json { head :no_content }
        else
         
        end
      end
    
  end
end
