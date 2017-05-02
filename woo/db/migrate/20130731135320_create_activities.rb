class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :title
      t.string :location
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.text :about
      t.integer :numpart
      t.string :website
      t.boolean :recurrent
      t.string :price

      t.timestamps
    end
  end
end