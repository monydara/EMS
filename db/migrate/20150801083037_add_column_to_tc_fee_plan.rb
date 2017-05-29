class AddColumnToTcFeePlan < ActiveRecord::Migration
  def up
    add_column :acc_tc_fee_plans , :acc_plan_master_id , :integer , after: :id
  end

  def down
    remove_column :acc_tc_fee_plans , :acc_plan_master_id
  end
end
