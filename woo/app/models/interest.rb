class Interest < ActiveRecord::Base
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  attr_accessible :activity_id, :interest
  belongs_to :activity
  
end
