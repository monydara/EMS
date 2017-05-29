class ChangeColumnsToAccReceipts < ActiveRecord::Migration
  def up
    add_column :acc_receipts, :receipt_type,:string, limit: 3, default: 'OTR',after: :receipt_no
                                            #TCR=T.C Receipt, WUR=W.U Receipt, OTR=Other Receipt
    add_column :acc_receipts, :ref_id, :integer, default: 0, after: :payer_name
    add_column :acc_receipts, :ref_type, :string, limit:1,default:'O', after: :receipt_type #L=Lead, S=Student, O=Other
    add_column :acc_receipts, :currency, :string, limit:3, default: 'USD',after: :receipt_type #USD, KHR

    remove_column :acc_receipts, :acc_charge_item_id
    remove_column :acc_receipts, :acc_charge_item_type_id
    remove_column :acc_receipts, :reference_no

  end
  def down
    remove_column :acc_receipts, :receipt_type
    remove_column :acc_receipts, :ref_id
    remove_column :acc_receipts, :ref_type
    remove_column :acc_receipts, :currency

    add_column :acc_receipts, :acc_charge_item_id, :integer
    add_column :acc_receipts, :acc_charge_item_type_id, :integer
    add_column :acc_receipts, :reference_no, :string

  end
end
