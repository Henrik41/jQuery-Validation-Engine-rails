class Follow < ActiveRecord::Base
  
  include PublicActivity::Model
  tracked except: :delete, owner: Proc.new{ |controller, model| controller.current_user }
  tracked notif: 'on'
  
    
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true

  def block!
    self.update_attribute(:blocked, true)
  end

end
