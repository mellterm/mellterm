class AddDocumentIdToSegments < ActiveRecord::Migration
  def self.up
    add_column :segments, :document_id, :integer
  end

  def self.down
    remove_column :segments, :document_id
  end
end
