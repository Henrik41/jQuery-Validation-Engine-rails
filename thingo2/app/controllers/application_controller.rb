class ApplicationController < ActionController::Base
  protect_from_forgery
  def define_user
    @user = current_user
  end
end
