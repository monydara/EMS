class AcdClassWu < ActiveRecord::Base
	has_many :acd_class_wu_detail , :foreign_key => "class_wu_id"
	belongs_to :acd_class_division , :foreign_key => "division_id"
	belongs_to :acd_degree ,:foreign_key => 'degree_id'
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	belongs_to :cfg_academic_year , :foreign_key => "academic_year_id"
	belongs_to :acd_class_shift , :foreign_key => "class_shift_id"
	belongs_to :acd_class_room , :foreign_key => "room_id"
	belongs_to :acd_standard , :foreign_key => "standard_id"
	has_many :sdn_class_student , :foreign_key => "class_id"
	#has_many :sdn_student , :through => :sdn_class_student
	accepts_nested_attributes_for :acd_class_wu_detail , :allow_destroy => true
	accepts_nested_attributes_for :sdn_class_student , :allow_destroy => true


end
