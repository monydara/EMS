class CreateAccDiscountItems < ActiveRecord::Migration
  def up
    create_table :acc_discount_items do |t|
    	t.string :item_code, limit:6
    	t.string :item_name, limit:50
    	t.integer :discount_type_id
    	t.date :effective_date
    	t.date :expired_date
    	t.string :Autherizer, limit:100
    	t.string :reference_no, limit:50
    	t.text	:note
    	t.boolean :is_del
    	t.integer :campus_id
      t.timestamps
    end
  end
  def down
  	drop_table :acc_discount_items
  	
  end
end
