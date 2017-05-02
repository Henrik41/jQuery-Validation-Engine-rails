class AddUserIdToInterestanswers < ActiveRecord::Migration
  def change
    add_column :interestanswers, :user_id, :integer
  end
end
