class AdduserfollowmeToUsers < ActiveRecord::Migration
  def change
      add_column :users, :userfollowme, :boolean
      add_column :users, :acceptme, :boolean
  end

end
