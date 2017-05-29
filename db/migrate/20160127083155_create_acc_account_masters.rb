class CreateAccAccountMasters < ActiveRecord::Migration

  def up
    create_table :acc_account_masters do |t|
      t.integer :student_id
      t.integer :admission_id
      t.integer :key_account_id
      t.integer :credit_control_id
      t.integer :fee_cat_id
      t.string  :fee_type,limit:2 #TC , WU
      t.integer :cycle_id
      t.string  :account_type, limit:1 #N=Normal, I=Installment, S=Scholarship
      t.decimal :fee_per_cycle,  precision:8, scale:2, default:0.00
      t.decimal :balance,  precision:8, scale:2, default:0.00
      t.string  :status, limit:1, default:'A' #A=Active, C=Closed, S=Suspend
      t.timestamps
    end
  end

  def down
    drop_table :acc_account_masters
  end

end
