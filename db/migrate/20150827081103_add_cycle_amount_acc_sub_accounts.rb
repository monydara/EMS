class AddCycleAmountAccSubAccounts < ActiveRecord::Migration
  def change
    add_column :acc_sub_accounts, :cycle_amount,:decimal, scale: 2,precision: 8, default: 0.0, after: :cycle_term
  end
end
