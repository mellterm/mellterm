class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :user_types do |t|
      t.string :name
      t.timestamps
    end
    UserType.reset_column_information
    %w{translator reviewer company}.each do |type|
      UserType.create(:name => type)
    end
  end

  def self.down
    drop_table :user_types
  end
end
