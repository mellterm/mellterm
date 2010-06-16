class AddPageExtraFields < ActiveRecord::Migration
  def self.up
    add_column :pages, :menu_order, :integer, :default => 1
    add_column :pages, :link_title, :string
  end

  def self.down
    remove_column :pages, :menu_order
    remove_column :pages, :link_title
  end
end
