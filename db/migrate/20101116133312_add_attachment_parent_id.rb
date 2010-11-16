class AddAttachmentParentId < ActiveRecord::Migration
  def self.up
    add_column :attachments, :parent_id, :integer
  end

  def self.down
    remove_column :attachments, :parent_id
  end
end
