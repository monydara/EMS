class AddModuleToSysMenu < ActiveRecord::Migration
  def up
    add_column :sys_menus, :module, :string, limit:50, after: :description
    add_column :sys_menus, :group, :string, limit:50, after: :module 
  end
  def down
  	remove_column :sys_menus, :module
  	remove_column :sys_menus, :group
  end
end
