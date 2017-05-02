class Yactivity < ActiveRecord::Base
  attr_accessible :user_id, :avatar, :name 
  mount_uploader :avatar, AvatarUploader
end
