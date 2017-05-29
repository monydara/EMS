class CreateAccStudentAccounts < ActiveRecord::Migration
  def up
    create_table :acc_student_accounts do |t|
      t.string  :account_no, :limit=>6
      t.integer :lead_id
      t.integer :student_id
      t.integer :cycle_type_id
      t.integer :cycle_remain
      t.integer :key_account_id
      t.integer :credit_control_id
      t.string  :account_type, :limit=>1, :default=>'N' #N=Normal, L=Loan, S=Scholarship 100%
      t.string  :vat_number, :limit=>20
      t.decimal :balance, precision: 12, scale: 2, default: 0.00
      t.date    :start_date
      t.date    :end_date
      t.text    :remark
      t.string  :status, :limit=>1, :default=>'N' #N=New, C=Completed, S=Stop, P=Suspend
      t.integer :campus_id
      t.timestamps
    end
  end
  def down
    drop_table :acc_student_accounts
  end
end
