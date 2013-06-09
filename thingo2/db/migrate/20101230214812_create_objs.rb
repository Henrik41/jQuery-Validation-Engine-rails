class CreateObjs < ActiveRecord::Migration
  def self.up
    create_table :objs do |t|
      t.integer :user_id
      t.string :idthingo
      t.string :name
      t.text :description
      t.string :category
      t.boolean :priv

      t.timestamps
    end
  end

  def self.down
    drop_table :objs
  end
end
