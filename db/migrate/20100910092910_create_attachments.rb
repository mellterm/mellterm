class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string  :title
      t.text    :notes
      t.integer :user_id, :default => nil
      t.boolean :is_private, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
