class AddColumnToUserRoleAndUserCampus < ActiveRecord::Migration
  def up
    add_column :sys_role_users , :assigned , :boolean, after: :user_id
    add_column :sys_user_campus , :assigned , :boolean , after: :gen_campus_id
  end
  def down
    remove_column :sys_role_users , :assigned
    remove_column :sys_user_campus ,:assigned
  end
end
