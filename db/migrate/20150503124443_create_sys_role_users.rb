class CreateSysRoleUsers < ActiveRecord::Migration
  def up
    create_table :sys_role_users do |t|
    	t.integer :role_id
    	t.integer :user_id
      t.timestamps
    end
  end
  def down
  	drop_table :sys_role_users
  end
end
