class CreateInterestanswers < ActiveRecord::Migration
  def change
    create_table :interestanswers do |t|
      t.integer :yactivity_id
      t.string :name
      t.boolean :answer

      t.timestamps
    end
  end
end
