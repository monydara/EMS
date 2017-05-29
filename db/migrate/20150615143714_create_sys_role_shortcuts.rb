class CreateSysRoleShortcuts < ActiveRecord::Migration
  def up
    create_table    :sys_role_shortcuts do |t|
      t.integer     :shortcut_id
      t.integer     :role_id
      t.timestamps
    end
  end
  def down
    drop_table      :sys_role_shortcuts
  end
end
