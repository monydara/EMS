class AddRemoveColAccInvoices < ActiveRecord::Migration
  def change
    remove_column :acc_invoices, :edu_type
    remove_column :acc_invoices, :degree_id
    remove_column :acc_invoices, :course_id
    remove_column :acc_invoices, :academic_year_id
    remove_column :acc_invoices, :full_name
    remove_column :acc_invoices, :phone_no
    remove_column :acc_invoices, :address
    remove_column :acc_invoices, :fiscal_year

    add_column :acc_invoices, :fee_amount, :decimal, scale: 2, precision: 10,default:0.0
    add_column :acc_invoices, :charge_amount, :decimal, scale: 2, precision: 10,default:0.0
    add_column :acc_invoices, :discount, :decimal, scale: 2, precision: 10, default: 0.0
    add_column :acc_invoices, :net_amount, :decimal, scale: 2, precision: 10, default: 0.0
    add_column :acc_invoices, :tax, :decimal, scale: 2, precision: 10, default: 0.0
  end
end
