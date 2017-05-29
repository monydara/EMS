class ChangeUserCodeToUserId < ActiveRecord::Migration
  def up
  	rename_column :sys_users , :user_code , :user_id
  end
  def down
  	rename_column :sys_users, :user_id , :user_code
  end
end
