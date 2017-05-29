class CreateAccInvoiceDetails < ActiveRecord::Migration
  def up
    create_table :acc_invoice_details do |t|
      t.integer :invoice_id
      t.string :edu_type,limit:2, default:'TC' #TC=Training Center, WU=Western University
      t.string  :item_type, limit:2,default:'FC' #FC=Fee Charge, AC=Additional Charge, DC=Discount; TX=Tax
      t.integer  :item_id
      t.decimal :amount, precision:12,scale:2,default:0.00
      t.text    :description
      t.boolean :is_deleted, default:false
      t.timestamps
    end
  end
  def down
    drop_table :acc_invoice_details
  end
end
