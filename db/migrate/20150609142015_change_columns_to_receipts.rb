class ChangeColumnsToReceipts < ActiveRecord::Migration
  def up
    remove_column :acc_receipts, :currency
    add_column :acc_receipts, :discount_amount, :decimal, precision: 10,scale: 2,after: :khr_amount
    add_column :acc_receipts, :charges_amount,:decimal,precision: 10,scale: 2,after: :khr_amount
    add_column :acc_receipt_details, :item_name, :string, limit:100
    add_column :acc_receipt_details, :item_unit, :string, limit:1,default: 'A' #A=Amount,#P=Percentage
  end
  def down
    add_column :acc_receipts, :currency,:string
    remove_column :acc_receipts, :discount_amount, :decimal, precision: 10,scale: 2,after: :khr_amount
    remove_column :acc_receipts, :charges_amount,:decimal,precision: 10,scale: 2,after: :khr_amount
    remove_column :acc_receipt_details, :item_name, :string, limit:100
    remove_column :acc_receipt_details, :item_unit, :string, limit:1,default: 'A' #A=Amount,#P=Percentage
  end
end
