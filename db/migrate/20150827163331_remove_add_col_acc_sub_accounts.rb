class RemoveAddColAccSubAccounts < ActiveRecord::Migration

  def change

    remove_column :acc_sub_accounts, :cycle_term
    remove_column :acc_sub_accounts, :cycle_term_id
    remove_column :acc_sub_accounts, :plan_name
    remove_column :acc_sub_accounts, :cycle_amount

    add_column :acc_sub_accounts,:cycle_type_id,:integer, after: :tuition_time
    add_column :acc_sub_accounts,:term_id,:integer,after: :cycle_type_id
    add_column :acc_sub_accounts,:cycle_fee,:decimal, scale: 2,precision: 8,default: 0.0,after: :term_id

  end

end
