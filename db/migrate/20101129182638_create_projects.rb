# Giang Nguyen
class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer  :company_id
      t.integer  :pt_status_id
      t.boolean  :approved, :default => false
      t.date     :start_date
      t.date     :due_date
      t.text     :instruction
      t.float    :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
