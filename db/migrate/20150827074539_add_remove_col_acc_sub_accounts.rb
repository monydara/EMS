class AddRemoveColAccSubAccounts < ActiveRecord::Migration
  def change
    remove_column :acc_sub_accounts, :item_id
    remove_column :acc_sub_accounts, :item_type
    add_column :acc_sub_accounts, :plan_id, :integer,after: :student_account_id
    add_column :acc_sub_accounts, :plan_name, :string , limit:100, after: :student_account_id
    add_column :acc_sub_accounts, :plan_type, :string , limit: 2 , default: 'TC' , after: :student_account_id#TC,WU
    add_column :acc_sub_accounts, :cycle_term_id,:integer, after: :student_account_id
    add_column :acc_sub_accounts, :cycle_term,:string, limit:50, after: :student_account_id
    add_column :acc_sub_accounts, :tuition_time, :integer, default: 1, after: :student_account_id #1=Full time, 0=Part time
    add_column :acc_sub_accounts, :is_deleted, :boolean, default: false, after: :status
  end
end
