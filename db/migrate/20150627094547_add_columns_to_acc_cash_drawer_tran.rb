class AddColumnsToAccCashDrawerTran < ActiveRecord::Migration
  def up
    add_column :acc_cash_drawer_trans, :open_amount_khr,:decimal,precision: 12,scale: 2,default: 0.00, after: :open_amount
    add_column :acc_cash_drawer_trans, :closed_amount_khr,:decimal,precision: 12,scale: 2,default: 0.00, after: :closed_amount
  end
  def down
    remove_column :acc_cash_drawer_trans, :open_amount_khr, :decimal
    remove_column :acc_cash_drawer_trans, :closed_amount_khr, :decimal
  end
end
