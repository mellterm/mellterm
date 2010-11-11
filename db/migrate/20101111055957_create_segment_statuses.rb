class CreateSegmentStatuses < ActiveRecord::Migration
  def self.up
    create_table :segment_statuses do |t|
      t.string :name
    end
    
    SegmentStatus.reset_column_information
    %w{reviewed translated query}.each do |type|
      SegmentStatus.create(:name => type)
    end
  end

  def self.down
    drop_table :segment_statuses
  end
end
