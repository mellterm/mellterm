class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string  :var
      t.text    :value
      t.text    :description
      t.timestamps
    end
    add_index :settings, :var, :unique => true
  end

  def self.down
    drop_table :settings
  end
end
