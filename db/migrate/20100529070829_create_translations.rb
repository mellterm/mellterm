class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.string  :source_content
      t.string  :target_content
      t.integer :source_language_id
      t.integer :target_language_id
      t.integer :category_id
      t.integer :company_id
      t.string :notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :translations
  end
end
