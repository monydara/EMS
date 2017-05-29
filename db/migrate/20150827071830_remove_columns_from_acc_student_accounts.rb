class RemoveColumnsFromAccStudentAccounts < ActiveRecord::Migration
  def up
    remove_column :acc_student_accounts, :cycle_remain
    remove_column :acc_student_accounts, :cycle_type_id
    remove_column :acc_student_accounts, :edu_type
  end
end
