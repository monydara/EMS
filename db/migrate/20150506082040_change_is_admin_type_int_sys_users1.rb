class ChangeIsAdminTypeIntSysUsers1 < ActiveRecord::Migration
  def up
    change_table :sys_users do |t|
      t.change :is_admin, :integer
    end
  end

  def down
    change_table :sys_users do |t|
      t.change :is_admin, :boolean
    end
  end
end
