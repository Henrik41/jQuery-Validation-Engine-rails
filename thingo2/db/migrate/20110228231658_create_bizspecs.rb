class CreateBizspecs < ActiveRecord::Migration
  def self.up
    create_table :bizspecs do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :tel
      t.string :fax
      t.string :email
      t.string :website
      t.string :btype

      t.timestamps
    end
  end

  def self.down
    drop_table :bizspecs
  end
end
