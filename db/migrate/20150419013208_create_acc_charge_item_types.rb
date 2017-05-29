class CreateAccChargeItemTypes < ActiveRecord::Migration
  def up
    create_table :acc_charge_item_types do |t|
    	t.string :item_type_code, limit:6, null:false
    	t.string :item_type_name, limit:50, null:false
    	t.text	 :note
    	t.boolean :is_del, default:false
      t.timestamps
    end
  end
  def down
  	drop_table :acc_charge_item_types
  end

end
