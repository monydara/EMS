class CreateSysUserDegrees < ActiveRecord::Migration
  def up
    create_table :sys_user_degrees do |t|
      t.integer :user_id
      t.integer :degree_id
      t.timestamps
    end
  end
  def down
    drop_table :sys_user_degrees
  end
end
