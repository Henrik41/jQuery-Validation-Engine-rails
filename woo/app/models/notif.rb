class Notif < ActiveRecord::Base
  attr_accessible :shout, :user_id
  belongs_to :user
end
