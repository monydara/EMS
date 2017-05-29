class RemoveColumnFeePlans < ActiveRecord::Migration
  def change
    remove_column :acc_plan_masters , :acd_batch_id
  end
end
