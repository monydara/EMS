class RemoveColFromAccTcFeePlans < ActiveRecord::Migration
  def change
    remove_column :acc_tc_fee_plans,:duration
  end
end
