class ChangeColumnTypeToFinanTran < ActiveRecord::Migration
  def change
    change_column :acc_finance_trans,:amount_usd,:decimal,precision:10, scale:4,default: 0.0
    change_column :acc_finance_trans,:amount_khr,:decimal,precision:10, scale:4,default: 0.0
  end
end
