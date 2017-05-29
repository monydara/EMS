class CreateAccDiscountItemDetails < ActiveRecord::Migration
  def up
    create_table :acc_discount_item_details do |t|
    	t.integer :fee_charge_id
    	t.integer :discount_item_detail_id
    	t.decimal :discount_amount, precision:8, scale:2, default:0.00
    	t.float	:discount_p, default:0
    	t.boolean :is_allow_edit, default:false
    	t.text		:note
    	t.boolean	:is_del, default:false
      
        t.timestamps
    end
  end

  def down
  	drop_table :acc_discount_item_details
  end
end
