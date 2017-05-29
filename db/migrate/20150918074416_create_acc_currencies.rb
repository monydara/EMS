class CreateAccCurrencies < ActiveRecord::Migration
  def up
    create_table :acc_currencies do |t|
      t.string :ccy_code, limit:3, null:false
      t.string :ccy_name, limit:50
      t.decimal :ccy_rate, scale:2, precision:8, default:0.0
      t.string :is_default, limit:1 , default:'N'
      t.string :status, limit:1, default:'O' # O=open , C=Closed
      t.integer :campus_id
      t.integer :maker_id
      t.integer :checker_id
      t.timestamps
    end
  end
  def down
    drop_table :acc_currencies
  end
end
