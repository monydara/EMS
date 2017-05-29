class AccDiscountCourse < ActiveRecord::Base
  belongs_to :acc_discount_item, foreign_key: "discount_item_id"
  belongs_to :acd_course_faculty, foreign_key: "course_id"
end
