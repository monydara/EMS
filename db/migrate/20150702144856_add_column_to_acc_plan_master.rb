class AddColumnToAccPlanMaster < ActiveRecord::Migration
  def up
    add_column :acc_plan_masters, :is_tc, :boolean , default: false, after: :description
  end
  def down
    remove_column :acc_plan_masters, :is_tc, :boolean
  end
end
