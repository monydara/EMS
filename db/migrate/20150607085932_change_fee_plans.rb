class ChangeFeePlans < ActiveRecord::Migration
  def up
    remove_column :acc_fee_plans, :acd_batche_id
    add_column :acc_plan_masters, :acd_batche_id, :integer, before: :plan_master_name
  end

  def down
    add_column :acc_fee_plans, :acd_batche_id, :integer
    remove_column :acc_plan_masters, :acd_batche_id
  end
end
