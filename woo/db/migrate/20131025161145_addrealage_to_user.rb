class AddrealageToUser < ActiveRecord::Migration
  def up
     add_column :users, :realage, :integer
  end

  def down
  end
end
