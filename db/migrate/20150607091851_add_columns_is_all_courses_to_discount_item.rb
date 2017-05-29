class AddColumnsIsAllCoursesToDiscountItem < ActiveRecord::Migration
  def up
    add_column :acc_discount_items, :is_all_courses,:boolean, default: false, after: :item_name
  end
  def down
    remove_column :acc_discount_items, :is_all_courses
  end
end
