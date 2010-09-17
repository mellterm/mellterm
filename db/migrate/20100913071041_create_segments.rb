class CreateSegments < ActiveRecord::Migration
  def self.up
    create_table :segments do |t|
      t.string  :source_content
      t.string  :target_content
      t.integer :source_language_id
      t.integer :target_language_id
      t.integer :category_id
      t.integer :company_id
      t.integer :user_id
      t.string :cru
      t.string :crd
      t.text :notes
      t.text :raw_data
      t.timestamps
    end
  end

  def self.down
    drop_table :sentences
  end
end
