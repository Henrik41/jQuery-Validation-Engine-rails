class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.integer :user_id
      t.string :name
      t.text :whoIam
      t.string :website
      t.string :country
      t.string :company
      t.timestamps
    end
  end

  def self.down
    drop_table :specs
  end
end
