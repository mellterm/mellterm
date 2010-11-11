class AddSegmentsStatus < ActiveRecord::Migration
  def self.up
    add_column :segments, :reviewer_id, :integer
    add_column :segments, :translator_id, :integer
    add_column :segments, :status_id, :string
  end

  def self.down
    remove_column :segments, :reviewer_id
    remove_column :segments, :translator_id
    remove_column :segments, :status_id
  end
end
