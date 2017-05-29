class ChageColumnAccountNoInTableStudentAccount < ActiveRecord::Migration
  def up
    remove_column :acc_student_accounts , :account_no
    add_column :acc_student_accounts , :account_no , :string  , limit:8 , after: :id
    next_version = NextVersion.find_by n_type:'ACCOUNT NO'
    next_version.update_attributes degit:8
  end

  def down
    remove_column :acc_student_accounts , :account_no
    add_column :acc_student_accounts , :account_no, :string , limit:6 , after: :id


  end
end
