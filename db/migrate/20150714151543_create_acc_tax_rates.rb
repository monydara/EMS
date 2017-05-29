class CreateAccTaxRates < ActiveRecord::Migration
  def up
    create_table :acc_tax_rates do |t|
      t.string :code, limit:6
      t.text  :description
      t.integer :tax_type_id
      t.decimal :tax_rate, precision:6, scale:2, default:0.00
      t.boolean :is_active, default:true
      t.boolean :is_deleted, default:false
      t.timestamps
    end
  end
  def down
    drop_table :acc_tax_rates
  end
end
