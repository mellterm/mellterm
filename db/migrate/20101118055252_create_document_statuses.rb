class CreateDocumentStatuses < ActiveRecord::Migration
  def self.up
    create_table :document_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :document_statuses
  end
end
