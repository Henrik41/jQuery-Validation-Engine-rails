class AddPartimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :partime, :boolean
  end
end
