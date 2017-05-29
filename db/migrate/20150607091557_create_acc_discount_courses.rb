class CreateAccDiscountCourses < ActiveRecord::Migration
  def up
    create_table :acc_discount_courses do |t|
      t.integer :discount_item_id
      t.integer :course_id
      t.timestamps
    end
  end
  def down
      drop_table :acc_discount_courses
  end
end
