class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      # paperclip columns
      t.string    :data_file_name
      t.string    :data_content_type
      t.integer   :data_file_size
      t.datetime  :date_updated_at
      # XLIFF custom columns
      t.string    :xliff_xmlns
      t.string    :xliff_version
      t.string    :xliff_original
      t.string    :xliff_source_language
      t.string    :xliff_datatype
      t.string    :xliff_tool
      t.string    :xliff_tool_id
      t.string    :xliff_date
      t.string    :xliff_xml_space
      t.string    :xliff_ts
      t.string    :xliff_category
      t.string    :xliff_target_language
      t.string    :xliff_product_name
      t.string    :xliff_product_version
      t.string    :xliff_build_num
      
      t.string    :file_encoding
      t.integer   :user_id
      t.integer   :team_id
      t.integer   :category_id
      t.integer   :company_id
      t.integer   :language_id
      t.boolean   :public, :default => false
      t.boolean   :assigned, :default => false
      t.boolean   :completed, :default => false
      t.datetime  :expires_at
      t.text      :description
      t.text      :notes
      t.timestamps
    end
    add_index :documents, :user_id
    add_index :documents, :category_id
    add_index :documents, :language_id
    add_index :documents, :team_id
    add_index :documents, :company_id
    add_index :documents, :public
    add_index :documents, :assigned
    add_index :documents, :completed
  end

  def self.down
    drop_table :documents
  end
end
