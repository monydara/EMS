class AcdCourseFaculty < ActiveRecord::Base
	has_many :acd_course_major , :foreign_key => "course_id"
	has_many :acd_degree_course , :foreign_key => "course_id"
	has_many :acd_batch_course , :foreign_key => "course_id"
	has_many :acd_course_subject , :foreign_key => "acd_course_id"
	has_many :acd_class_tc , :foreign_key => "course_id"
	has_many :acd_class_wu , :foreign_key => "course_id"
	has_many :sdn_lead , :foreign_key => "course_id"
	has_many :acd_course_level , :foreign_key => "course_id"

	#has_many :acd_course_faculty ,:foreign_key => "course_id"
	has_many :acc_tc_fee_plan , foreign_key:'course_id'

	accepts_nested_attributes_for :acd_course_subject , :allow_destroy => true
	accepts_nested_attributes_for :acd_batch_course , :allow_destroy => true
	accepts_nested_attributes_for :acd_degree_course , :allow_destroy => true
	accepts_nested_attributes_for :acd_course_major , :allow_destroy => true
	has_many :acc_fee_plans, :foreign_key => "acd_course_facultie_id"

		# for student movement
	has_many :sdn_status_log, :foreign_key => "course_id"
end
