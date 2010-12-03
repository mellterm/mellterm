class CreatePtStatuses < ActiveRecord::Migration
  def self.up
    create_table :pt_statuses do |t|
      t.string :name
      t.text   :description
    end
  end

  def self.down
    drop_table :pt_statuses
  end
end
