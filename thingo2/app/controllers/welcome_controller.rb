class WelcomeController < ApplicationController
  def index
    @user = User.find(:all)
  end

end
