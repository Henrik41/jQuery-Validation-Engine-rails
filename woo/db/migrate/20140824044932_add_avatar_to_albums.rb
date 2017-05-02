class AddAvatarToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :avatar, :string
  end
end
