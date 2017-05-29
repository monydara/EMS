class AddBachItToTableAccSubAccount < ActiveRecord::Migration
  def up
    add_column :acc_sub_accounts , :batch_id , :integer , after: :plan_id
  end
  def down
      remove_column :acc_sub_accounts , :batch_id
  end
end
