class AddDescriptionToSysMenu < ActiveRecord::Migration
  def up
    add_column :sys_menus, :description, :string, limit:50, after: :name
  end
  def down
  	remove_column :sys_menus, :description
  end

end
