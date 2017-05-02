class AddNoemailregToUser < ActiveRecord::Migration
  def change
    add_column :users, :nomailreg, :boolean
  end
end
