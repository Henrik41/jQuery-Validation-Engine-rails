class CreateYactivities < ActiveRecord::Migration
  def change
    create_table :yactivities do |t|
      t.integer :user_id
      t.string :avatar
      t.string :name

      t.timestamps
    end
  end
end
