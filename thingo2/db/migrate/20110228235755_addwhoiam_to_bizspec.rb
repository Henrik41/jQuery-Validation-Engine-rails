class AddwhoiamToBizspec < ActiveRecord::Migration
  def self.up
    add_column :bizspecs, :whoiam, :text
  end

  def self.down
     remove_column :bizspecs, :whoiam
  end
end
