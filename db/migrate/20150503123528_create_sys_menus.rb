class CreateSysMenus < ActiveRecord::Migration
  def up
    create_table :sys_menus do |t|
      t.string :name, limit:50
      t.string :url
      t.string :action, limit:50
      t.timestamps
    end
  end
  def down
  	drop_table :sys_menus
  	
  end
end
