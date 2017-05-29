class RenameColumnPasswordToSysUsers < ActiveRecord::Migration
  def up
    rename_column :sys_users, :password, :encrypted_password
  end
end
