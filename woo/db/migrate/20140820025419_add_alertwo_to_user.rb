class AddAlertwoToUser < ActiveRecord::Migration
  def change
    add_column :users, :alertwoo, :boolean
  end
end
