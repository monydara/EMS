class RemoveColumnsFromSysUserCampusAndUserRole < ActiveRecord::Migration
  def change
    remove_column :sys_user_campus, :assigned
    remove_column :sys_role_users, :assigned
  end

end
