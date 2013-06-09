class CreateCategory2s < ActiveRecord::Migration
  def self.up
    create_table :category2s do |t|
      t.integer :obj_id
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :category2s
  end
end
