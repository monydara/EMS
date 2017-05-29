class CreateAccAccountDetails < ActiveRecord::Migration
  def up
    create_table :acc_account_details do |t|
      t.integer :account_id
      t.integer :item_id
      t.string :item_type, limit:1 #D=Discount, A=Additional Charge, T=Tax
      t.string :item_unit, limit:1 #P=Percentage, A=Amount
      t.decimal :item_value, precision:8, scale:2, default:0.00
      t.boolean :is_recurring
      t.integer :recurring_val,default:0
      t.date    :effective_date
      t.date    :expired_date
      t.text    :comments
      t.boolean :is_deleted, default:false
      t.timestamps
    end
  end

  def down
    drop_table :acc_account_details
  end
end
