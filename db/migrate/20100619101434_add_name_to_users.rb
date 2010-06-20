class AddNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :time_zone, :string
    add_column :users, :notes, :text
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :phone
    remove_column :users, :address
    remove_column :users, :time_zone
    remove_column :users, :notes
  end
end
