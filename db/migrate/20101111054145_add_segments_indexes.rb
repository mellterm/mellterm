class AddSegmentsIndexes < ActiveRecord::Migration
  def self.up
    add_index :segments, :source_language_id
    add_index :segments, :target_language_id
    add_index :segments, :category_id
    add_index :segments, :company_id
    add_index :segments, :user_id
    add_index :segments, :document_id
    add_index :segments, :updated_by
    add_index :segments, :reviewer_id
    add_index :segments, :translator_id
    add_index :segments, :status_id
  end

  def self.down
  end
end
