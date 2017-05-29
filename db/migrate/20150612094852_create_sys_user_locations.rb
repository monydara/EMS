class CreateSysUserLocations < ActiveRecord::Migration
  def up
    create_table :sys_user_locations do |t|
      t.integer :user_id
      t.integer :campus_id
      t.timestamps
    end
  end

  def down
    drop_table :sys_user_locations
  end
end
