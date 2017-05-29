class AddChargeItemsToReceipts < ActiveRecord::Migration
  def up
  	add_column :acc_receipts, :acc_charge_item_id, :integer, after: :acc_charge_item_type_id
  end
  def down
  	remove_column :acc_receipts, :acc_charge_item_id
  end
end
