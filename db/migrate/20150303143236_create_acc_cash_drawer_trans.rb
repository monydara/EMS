class CreateAccCashDrawerTrans < ActiveRecord::Migration
  def up
    create_table :acc_cash_drawer_trans do |t|
    	t.integer 'acc_cash_drawer_id'
    	t.integer 'open_by'
    	t.float 'open_amount'
    	t.integer 'closed_by'
    	t.float 'closed_amount'
    	t.date 'open_date'
    	t.date 'closed_date'
    	t.integer 'campus_id'
      t.timestamps
    end
  end

  def down
  	drop_table :acc_cash_drawer_trans
  end
end
