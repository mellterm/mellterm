class AddPageLocation < ActiveRecord::Migration
  def self.up
    add_column :pages, :location, :string, :default => "page"
    add_column :pages, :display_order, :integer, :default => 1
  end

  def self.down
    remove_column :pages, :location
    remove_column :pages, :display_order
  end
end
