class CreateAccCashDrawerGroups < ActiveRecord::Migration
  def up
    create_table :acc_cash_drawer_groups do |t|
    	t.string 'group_name'
    	t.text 'description'
    	t.boolean 'is_active'
    	t.boolean 'is_deleted'
    	t.integer 'campus_id'
    	t.integer 'created_by'
      t.timestamps
    end
  end

  def down
  	drop_table :acc_cash_drawer_groups
  	
  end
end
