class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :pt_status_id
      t.boolean :approved, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
