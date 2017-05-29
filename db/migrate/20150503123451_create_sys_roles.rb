class CreateSysRoles < ActiveRecord::Migration
  def up
    create_table :sys_roles do |t|
    	t.string :code, limit:6
    	t.string :name, limit:50
    	t.text	 :description
    	t.boolean :is_deleted, default:false
      t.timestamps
    end
  end
  def down
  	drop_table :sys_roles
  end
end
