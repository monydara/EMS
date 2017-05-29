class CreateAccInvoices < ActiveRecord::Migration
  def up
    create_table :acc_invoices do |t|
      t.string :invoice_no,limit:10
      t.string :edu_type,limit:2, default:'TC' #TC=Training Center, WU=Western University
      t.integer :account_id
      t.integer :student_id
      t.integer :degree_id
      t.integer :course_id
      t.integer :academic_year_id
      t.integer :cycle_type_id
      t.integer :billing_process_id
      t.string  :account_no, limit:15
      t.string  :full_name, limit:100
      t.string  :phone_no, limit:50
      t.text    :address
      t.string  :vat_number,limit:20
      t.integer :fiscal_year, default:9999
      t.date    :issue_date
      t.date    :due_date
      t.date    :from_date
      t.date    :to_date
      t.decimal :total_amount, precision:22,scale:2
      t.decimal :brought_forward_balance, precision:22,scale:2
      t.decimal :balance, precision:22,scale:2
      t.timestamps
    end
  end
  def down
    drop_table :acc_invoices
  end
end
