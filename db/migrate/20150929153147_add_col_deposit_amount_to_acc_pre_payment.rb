class AddColDepositAmountToAccPrePayment < ActiveRecord::Migration
  def up
    add_column :acc_student_accounts,:deposit_amount,:decimal,precision: 8,scale: 2,default: 0.0, after: :vat_number
  end

  def down
    remove_column :acc_student_accounts,:deposit_amount
  end
end
