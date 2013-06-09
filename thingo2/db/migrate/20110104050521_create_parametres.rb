class CreateParametres < ActiveRecord::Migration
  def self.up
    create_table :parametres do |t|
      t.integer :obj_id
      t.string :name
      t.string :valu

      t.timestamps
    end
  end

  def self.down
    drop_table :parametres
  end
end
