class Userinterest < ActiveRecord::Base
  attr_accessible :interest, :user_id
  belongs_to :user
end
