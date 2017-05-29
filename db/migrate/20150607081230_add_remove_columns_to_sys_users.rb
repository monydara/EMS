class AddRemoveColumnsToSysUsers < ActiveRecord::Migration

  def up
    add_column :sys_users,:user_type,:string, :limit => 10, default: 'Staff'
    add_column :sys_users,:start_date, :date
    add_column :sys_users, :home_campus_id, :integer
    remove_column :sys_users, :is_admin
  end

  def down
    remove_column :sys_users, :user_type, :string
    remove_column :sys_users, :start_date, :date
    remove_column :sys_users, :home_campus_id, :integer
    add_column :sys_users, :is_admin, :boolean
  end

end
