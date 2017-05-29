class CreateAccCashDrawers < ActiveRecord::Migration
  def up
    create_table :acc_cash_drawers do |t|
    	t.integer 'cdg_id'
    	t.integer 'user_id'
    	t.boolean 'is_active'
    	t.boolean 'is_deleted'
    	t.integer 'create_by'
      t.timestamps
    end
  end

  def down
  	drop_table :acc_cash_drawers
  end
end
