class ChangeColumnInDiscountItem < ActiveRecord::Migration
  def up
    remove_column :acc_discount_item_details , :discount_amount
    remove_column :acc_discount_item_details , :discount_p
    add_column :acc_discount_item_details , :discount_unit , :string , :limit =>1 # P = Percentage(%) , A = Amount($)
    add_column :acc_discount_item_details , :discount_value , :decimal
  end
  def down
    add_column :acc_discount_item_details , :discount_amount , :decimal
    add_column :acc_discount_item_details , :discount_p , :decimal
    remove_column :acc_discount_item_details , :discount_unit
    remove_column :acc_discount_item_details , :discount_value
  end
end
