class AddFollowmeToUser < ActiveRecord::Migration
  def change
    add_column :users, :followme, :boolean
  end
end
