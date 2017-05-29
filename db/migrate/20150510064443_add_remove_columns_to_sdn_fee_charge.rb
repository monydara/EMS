class AddRemoveColumnsToSdnFeeCharge < ActiveRecord::Migration
  def up
    add_column :sdn_fee_charges, :pay_type, :string, limit:1, after: :credit_control_id
                                 #N=Normal Pay(Pay by Cycle), L=Loan Pay(Pay anytime), S=Scholarship 100% (Not Pay)
    add_column :sdn_fee_charges, :deposit_receipt_no, :string, limit:6, after: :vat_number
    add_column :sdn_fee_charges, :deposit_fee, :decimal,precision:8, scale:2, default:0.00, after: :deposit_receipt_no
    add_column :sdn_fee_charges, :net_cycle_fee, :decimal,precision:8, scale:2, default:0.00, after: :cycle_fee
    add_column :sdn_fee_charges, :fee_paid, :decimal,precision:8, scale:2, default:0.00, after: :total_fee
    add_column :sdn_fee_charges, :credit_balance, :decimal,precision:8, scale:2, default:0.00, after: :fee_paid

    remove_column :sdn_fee_charges, :pre_receipt_no
    remove_column :sdn_fee_charges, :tuition_fee
    remove_column :sdn_fee_charges, :discount_amount
    remove_column :sdn_fee_charges, :discount_p
    remove_column :sdn_fee_charges, :additional_fee
    remove_column :sdn_fee_charges, :paid_amount
    remove_column :sdn_fee_charges, :unpaid_amount
  end

  def down
    remove_column :sdn_fee_charges, :pay_type
    remove_column :sdn_fee_charges, :deposit_receipt_no
    remove_column :sdn_fee_charges, :deposit_fee
    remove_column :sdn_fee_charges, :net_cycle_fee
    remove_column :sdn_fee_charges, :fee_paid
    remove_column :sdn_fee_charges, :credit_balance

    add_column :sdn_fee_charges, :pre_receipt_no, :string, limit:6
    add_column :sdn_fee_charges, :tuition_fee, :decimal
    add_column :sdn_fee_charges, :discount_amount, :decimal
    add_column :sdn_fee_charges, :discount_p, :decimal
    add_column :sdn_fee_charges, :additional_fee, :decimal
    add_column :sdn_fee_charges, :paid_amount, :decimal
    add_column :sdn_fee_charges, :unpaid_amount, :decimal


  end
end
