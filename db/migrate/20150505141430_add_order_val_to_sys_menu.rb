class AddOrderValToSysMenu < ActiveRecord::Migration
  def up
  	add_column :sys_menus, :order_val, :integer, after: :action
  end
  def down
  	remove_column :sys_menus, :order_val
  end
end
