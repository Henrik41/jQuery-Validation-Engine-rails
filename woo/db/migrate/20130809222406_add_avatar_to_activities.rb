class AddAvatarToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :avatar, :string
  end
end
