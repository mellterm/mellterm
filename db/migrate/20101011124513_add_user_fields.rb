class AddUserFields < ActiveRecord::Migration
  def self.up
    add_column :users, :name_title, :string
    add_column :users, :language_id, :integer
    add_column :users, :user_type_id, :integer
    add_column :users, :country_name, :string
    add_column :users, :skype, :string
    # Paperclip
    add_column :users, :avatar_file_name,    :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size,    :integer
    add_column :users, :avatar_updated_at,   :datetime
    
    # Some indexes for search
    add_index :users, :language_id
    add_index :users, :user_type_id
  end

  def self.down
    remove_column :users, :name_title
    remove_column :users, :language_id
    remove_column :users, :user_type_id
    remove_column :users, :country_name
    remove_column :users, :skype
    # Paperclip
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
  end
end
