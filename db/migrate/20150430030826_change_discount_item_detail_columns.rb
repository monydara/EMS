class ChangeDiscountItemDetailColumns < ActiveRecord::Migration
  def up
  	remove_column :acc_discount_item_details , :fee_charge_id
  	rename_column :acc_discount_item_details , :discount_item_detail_id , :acc_discount_item_id
  end
  def down
  	add_column :acc_discount_item_details , :fee_charge_id, :integer
  	rename_column :acc_discount_item_details , :acc_discount_item_id , :discount_item_detail_id
  end
end
