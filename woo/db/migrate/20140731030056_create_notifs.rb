class CreateNotifs < ActiveRecord::Migration
  def change
    create_table :notifs do |t|
      t.integer :user_id
      t.string :shout

      t.timestamps
    end
  end
end
