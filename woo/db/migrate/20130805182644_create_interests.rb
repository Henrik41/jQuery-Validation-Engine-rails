class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :activity_id
      t.string :interest

      t.timestamps
    end
  end
end
