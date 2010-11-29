class CreateTasksUsers < ActiveRecord::Migration
  def self.up
    create_table :tasks_users do |t|
      t.integer :task_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :tasks_users
  end
end
