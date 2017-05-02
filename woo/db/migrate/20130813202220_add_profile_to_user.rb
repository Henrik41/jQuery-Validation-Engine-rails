class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :status, :string
    add_column :users, :about, :text
    add_column :users, :web, :string
  end
end
