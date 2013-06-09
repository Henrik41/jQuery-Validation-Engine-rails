class AddInfotoSpec < ActiveRecord::Migration
  def self.up
     add_column :specs, :lastname, :string
     add_column :specs, :sex, :string
     add_column :specs, :birth, :date
     add_column :specs, :position, :string
     add_column :specs, :website, :string
  end

  def self.down
    remove_column :specs, :lastname
    remove_column :specs, :sex
    remove_column :specs, :birth
    remove_column :specs, :position
     remove_column :website, :position
  end
end
