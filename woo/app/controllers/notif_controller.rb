class NotifController < ApplicationController
  
  def index
    @messages = Notif.all.last(10)
  end

  def create
    @message = Notif.create!(params[:notif])
  end
end