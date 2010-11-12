class AddTranslationFields < ActiveRecord::Migration
  def self.up
    add_column :translations, :approved, :boolean, :default => false
    add_column :translations, :is_public, :boolean, :default => true
    add_column :translations, :pos, :string
    add_column :translations, :authority, :integer
    add_column :translations, :doc_name, :string
    add_column :translations, :document_id, :integer
  end

  def self.down
    remove_column :translations, :approved
    remove_column :translations, :is_public
    remove_column :translations, :pos
    remove_column :translations, :authority
    remove_column :translations, :doc_name
    remove_column :translations, :document_id
  end
end
