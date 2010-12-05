class AddTitleToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :title, :string
  end

  def self.down
    remove_column :projects, :title
  end
end
