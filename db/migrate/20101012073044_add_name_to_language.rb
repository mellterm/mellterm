class AddNameToLanguage < ActiveRecord::Migration
  def self.up
    add_column :languages, :name, :string
    execute "update languages set name = title;"
  end

  def self.down
    remove_column :languages, :name
  end
end
