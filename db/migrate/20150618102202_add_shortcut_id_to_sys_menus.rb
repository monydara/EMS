class AddShortcutIdToSysMenus < ActiveRecord::Migration
  def up
    add_column :sys_menus, :shortcut_id, :integer
  end
  def down
    remove_column :sys_menus, :shortcut_id
  end
end
