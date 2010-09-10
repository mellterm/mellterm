class AddHeaderToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :header_content, :text
  end

  def self.down
    remove_column :pages, :header_content
  end
end
