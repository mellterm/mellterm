class AddCategoriesTranslations < ActiveRecord::Migration
  def self.up
    remove_column :translations, :category_id
    
    create_table :categories_translations, :id => false do |t|
      t.integer :category_id
      t.integer :translation_id
    end
  end

  def self.down
    create_column :translation, :category_id, :integer
    drop_table :categories_translations
  end
end
