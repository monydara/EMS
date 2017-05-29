class CreateSysShortcutMenus < ActiveRecord::Migration
  def up
    create_table :sys_shortcut_menus do |t|
    	t.integer :shortcut_id
    	t.integer :role_id
    	t.integer :menu_id
      t.timestamps
    end
  end
  def down
  	drop_table :sys_shortcut_menus
  end
end
