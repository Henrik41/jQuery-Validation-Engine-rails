class CreateAddinfos < ActiveRecord::Migration
  def self.up
    create_table :addinfos do |t|
      t.integer :spec_id
      t.string :addlabel
      t.string :addvalue

      t.timestamps
    end
  end

  def self.down
    drop_table :addinfos
  end
end
