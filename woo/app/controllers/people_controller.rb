class PeopleController < ApplicationController
  def index
    @people = User.near([current_user.latitude,current_user.longitude]).order("distance").page(params[:page]).per(8)
    @loc = current_user.location
  end
end
