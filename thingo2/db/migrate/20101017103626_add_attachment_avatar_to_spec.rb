class AddAttachmentAvatarToSpec < ActiveRecord::Migration
  def self.up
    add_column :specs, :avatar_file_name, :string
    add_column :specs, :avatar_content_type, :string
    add_column :specs, :avatar_file_size, :integer
    add_column :specs, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :specs, :avatar_file_name
    remove_column :specs, :avatar_content_type
    remove_column :specs, :avatar_file_size
    remove_column :specs, :avatar_updated_at
  end
end
