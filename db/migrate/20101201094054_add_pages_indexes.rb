class AddPagesIndexes < ActiveRecord::Migration
  def self.up
    add_index :pages, :language_id
    add_index :pages, :menu_order
    add_index :pages, :title
  end

  def self.down
    remove_index :pages, :language_id
    remove_index :pages, :menu_order
    remove_index :pages, :title
  end
end
