class AddTranslationTypes < ActiveRecord::Migration
  def self.up
    add_column :translations, :type, :string
    add_index :translations, :type
    add_index :translations, [:id, :type]
  end

  def self.down
    remove_column :translations, :type
  end
end
