class AddColumnIsActiveToAccTcFeePlan < ActiveRecord::Migration
  def up
      add_column :acc_tc_fee_plans, :is_active, :boolean, default:true,after: :term_four_fee
  end
  def down
      remove_column :acc_tc_fee_plans, :is_active
  end
end
