class AddInternalIdToPage < ActiveRecord::Migration
  def self.up
    add_column :translations, :internal_id, :string
    add_column :translations, :source, :string
  end

  def self.down
    remove_column :translations, :source
    remove_column :translations, :internal_id
  end
end
