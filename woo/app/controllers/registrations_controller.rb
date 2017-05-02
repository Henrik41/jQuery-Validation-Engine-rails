class  RegistrationsController < Devise::RegistrationsController
  protected


  def after_sign_up_path_for(resource_or_scope)
    profilepage_path
  end
  

end