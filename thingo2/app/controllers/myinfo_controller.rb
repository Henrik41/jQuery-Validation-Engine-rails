class MyinfoController < ApplicationController
  
  # This is going to be usefull in case you want to inform the member he has a mail
   before_filter :define_mail

  
  def show
    @user = current_user
    @user.spec ||= Spec.new
    @spec = @user.spec
# profile edit page
    @path_edit= "/specs/" << @user.id.to_s << "/edit"
    
# This colaculates the Following for Users and object you are following.
    @followers = @user.following_by_type('User').limit(2)
    @followobj = @user.following_by_type('Obj').limit(3)
    
# This is the counter for the completion bar. 

    @prog = @spec.attributes.count{ |attr, value| value.blank? }
      
      @completed = (10-@prog)*10
# --------------------------------------
    respond_to do |format|
       format.js {}
       format.html
    end
  end
  
    def showbiz
      @user = current_user
      @user.bizspec ||= Bizspec.new
      @bizspec = @user.bizspec
  # profile edit page
      @path_edit= "/bizspecs/" << @user.id.to_s << "/edit"

  # This colaculates the Following for Users and object you are following.
      @followers = @user.following_by_type('User').limit(2)
      @followobj = @user.following_by_type('Obj').limit(3)

  # This is the counter for the completion bar. 

      @prog = @bizspec.attributes.count{ |attr, value| value.blank? }

        @completed = (10-@prog)*10
  # --------------------------------------
      respond_to do |format|
         format.js {}
         format.html
      end
    end

  def create
    respond_to do |format|
       format.js {}
       format.html
    end
  end

  def update
  end

  def destroy
  end
  

  
  private 
  def define_mail
    @message = Message.all
  end

end
