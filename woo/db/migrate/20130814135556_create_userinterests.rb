class CreateUserinterests < ActiveRecord::Migration
  def change
    create_table :userinterests do |t|
      t.integer :user_id
      t.string :interest

      t.timestamps
    end
  end
end
