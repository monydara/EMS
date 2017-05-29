class ChangeColumnsToAccCashDrawerTran < ActiveRecord::Migration
  def change
    change_column :acc_cash_drawer_trans, :open_amount, :decimal, precision: 12, scale: 2, default: 0.00
    change_column :acc_cash_drawer_trans, :closed_amount, :decimal, precision: 12, scale: 2, default: 0.00
  end
end
