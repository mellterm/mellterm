class AddTranslationCategoryIndexes < ActiveRecord::Migration
  def self.up
    add_index :categories_translations, :category_id
    add_index :categories_translations, :translation_id
    add_index :categories_translations, [:category_id, :translation_id]
    add_index :translations, :source_language_id
    add_index :translations, :target_language_id
    add_index :translations, :company_id
    add_index :translations, :user_id
    add_index :users, :admin
    add_index :pages, :permalink
    add_index :pages, :language_id
    add_index :pages, :menu_order
    add_index :pages, :title
  end

  def self.down
  end
end
