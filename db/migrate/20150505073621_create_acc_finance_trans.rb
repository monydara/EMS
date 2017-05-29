class CreateAccFinanceTrans < ActiveRecord::Migration
  def up
    create_table :acc_finance_trans do |t|
    	t.string	:receipt_no, limit:6
    	t.integer	:acc_tran_type_id
    	t.integer 	:acc_reason_type_id
    	t.integer 	:acc_cash_drawer_tran_id
    	t.integer 	:acc_payment_method_id
    	t.string	  :ref_no, limit:30
    	t.datetime	:tran_date
      t.decimal	 :usd_amount, default:0,precision:10, scale:4
      t.decimal	 :khr_amount, default:0,precision:10, scale:4
    	t.datetime 	:commited_date
    	t.datetime 	:rollback_date
    	t.text		:remark
    	t.integer 	:campus_id    	
    		
      	t.timestamps
    end
  end
  def down
  	 :acc_finance_trans
  end
end
