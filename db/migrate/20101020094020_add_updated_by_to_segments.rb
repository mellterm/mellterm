class AddUpdatedByToSegments < ActiveRecord::Migration
  def self.up
    add_column :segments, :updated_by, :integer
  end

  def self.down
    remove_columnd :segments, :updated_by
  end
end
