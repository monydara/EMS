class CreateAccChargeItems < ActiveRecord::Migration
  def up
    create_table :acc_charge_items do |t|
    	t.string :item_code, limit:6
    	t.string :item_name, limit:50
    	t.integer :item_type_id
    	t.decimal :charge_amount, precision:8, scale:2, default:0.00
    	t.text :note
    	t.integer :campus_id
    	t.boolean :is_del, default:true
    	
      t.timestamps
    end
  end
  def down
  	drop_table :acc_charge_items
  end
end
