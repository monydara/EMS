class CreateAccCcyRateHistories < ActiveRecord::Migration
  def up
    create_table :acc_ccy_rate_histories do |t|
      t.integer :ccy_id
      t.decimal :old_rate, scale:2, precision:8, default:0.0
      t.decimal :new_rate, scale:2, precision:8, default:0.0
      t.integer :user_id
      t.integer :campus_id
      t.timestamps
    end
  end

  def down
    drop_table :acc_ccy_rate_histories
  end
end
