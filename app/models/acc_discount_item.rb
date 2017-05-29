class AccDiscountItem < ActiveRecord::Base
	belongs_to :acc_discount_type, foreign_key: "discount_type_id"
	has_many :acc_discount_item_details
	has_many :acc_discount_course , foreign_key:"discount_item_id"
	accepts_nested_attributes_for :acc_discount_item_details, :allow_destroy => true	
	accepts_nested_attributes_for :acc_discount_course, :allow_destroy => true	

end
