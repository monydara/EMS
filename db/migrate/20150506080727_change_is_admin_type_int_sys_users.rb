class ChangeIsAdminTypeIntSysUsers < ActiveRecord::Migration
  def up
    change_table :sys_users do |t|
      t.change :is_admin, :integer, {limit:1}
    end
  end

  def down
    change_table :sys_users do |t|
      t.change :is_admin, :boolean
    end
  end
end
