class CreateAccPrePayments < ActiveRecord::Migration
  def up
    create_table :acc_pre_payments do |t|
      t.integer :lead_id
      t.integer :fin_tran_id
      t.date    :trn_date
      t.string  :currency, limit:3,default:'USD'
      t.decimal :trn_amount, scale:4,precision:18, default:0.0
      t.decimal :ex_rate, scale:4,precision:8, default:0.0
      t.decimal :lcy_amount, scale:4,precision:18, default:0.0
      t.text    :remake
      t.string  :status, limit:1,default:'B'
      t.integer :maker_id
      t.integer :checker_id
      t.integer :campus_id
      t.timestamps
    end
  end
  def down
    drop_table :acc_pre_payments
  end
end
