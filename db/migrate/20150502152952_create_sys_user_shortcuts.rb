class CreateSysUserShortcuts < ActiveRecord::Migration
  def up
    create_table :sys_user_shortcuts do |t|
      t.integer :user_id
      t.integer :shortcut_id
      t.timestamps
    end
  end
  def down
  	drop_table :sys_user_shortcuts
  end
end
