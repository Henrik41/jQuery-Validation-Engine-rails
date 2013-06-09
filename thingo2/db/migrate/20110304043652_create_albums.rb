class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :obj_id
      t.string :caption

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
