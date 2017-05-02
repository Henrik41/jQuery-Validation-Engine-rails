class Album < ActiveRecord::Base
  attr_accessible :user_id, :avatar
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
end
