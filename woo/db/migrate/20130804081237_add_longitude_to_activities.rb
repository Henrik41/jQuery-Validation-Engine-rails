class AddLongitudeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :longitude, :float
    add_column :activities, :latitude, :float
  end
end
