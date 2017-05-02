class AddNotifToEvents < ActiveRecord::Migration
  def change
      change_table :events do |t|
        t.string :notif
      end
    end
end
