class AddColsToAccInvoice < ActiveRecord::Migration
  def up
    add_column :acc_invoices,:campus_id,:integer
    add_column :acc_invoices,:is_deleted, :boolean,default: false
  end
  def down

    remove_column :acc_invoices,:campus_id
    remove_column :acc_invoices,:is_deleted
  end
end
