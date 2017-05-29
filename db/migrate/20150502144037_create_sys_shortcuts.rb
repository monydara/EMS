class CreateSysShortcuts < ActiveRecord::Migration
  def up
    create_table :sys_shortcuts do |t|
    	t.string :name, limit:50
    	t.string :iconCls, limit:50
    	t.string :module, limit:50
    	t.string :modules, limit:50
      t.timestamps
    end
  end

  def down
  	drop_table :sys_shortcuts
  end
end
