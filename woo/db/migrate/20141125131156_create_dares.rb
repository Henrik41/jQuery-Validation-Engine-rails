class CreateDares < ActiveRecord::Migration
  def change
    create_table :dares do |t|
      t.string :question
      t.string :answer
      t.integer :user_id
      t.boolean :priv

      t.timestamps
    end
  end
end
