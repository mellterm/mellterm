class AddApprovedToSegments < ActiveRecord::Migration
  def self.up
    add_column :segments, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :segments, :approved
  end
end
