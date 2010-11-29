class AddTaskIdToSegment < ActiveRecord::Migration
  def self.up
    add_column :segments, :task_id, :integer
  end

  def self.down
    remove_column :segments, :task_id
  end
end
