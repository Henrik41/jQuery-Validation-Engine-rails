class AddDatetimeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :starting, :datetime
    add_column :activities, :ending, :datetime
  end
end
