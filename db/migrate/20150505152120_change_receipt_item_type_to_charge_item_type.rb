class ChangeReceiptItemTypeToChargeItemType < ActiveRecord::Migration
  def up
  	rename_column :acc_receipts , :acc_item_type_id , :acc_charge_item_type_id
  	change_column :acc_receipts , :receipt_date, :date
  	change_column :acc_finance_trans , :commited_date, :date
  	change_column :acc_finance_trans , :rollback_date, :date
    change_column :acc_finance_trans , :tran_date, :date
  end
  def down
  	rename_column :acc_receipts , :acc_charge_item_type_id , :acc_item_type_id
  	change_column :acc_receipts , :receipt_date, :datetime
  	change_column :acc_finance_trans , :commited_date, :datetime
  	change_column :acc_finance_trans , :rollback_date, :datetime
    change_column :acc_finance_trans , :tran_date, :datetime
  end
end
