class AddNomailToUser < ActiveRecord::Migration
  def change
    add_column :users, :nomail, :boolean
  end
end
