class AcdClassTc < ActiveRecord::Base
	has_many :acd_class_tc_detail , :foreign_key => "class_tc_id"
	belongs_to :acd_degree ,:foreign_key => 'degree_id'
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	belongs_to :cfg_academic_year , :foreign_key => "academic_year_id"
	belongs_to :acd_term , :foreign_key => "term_id"
	belongs_to :acd_class_shift , :foreign_key => "session_id"
	belongs_to :acd_tuition_time , foreign_key:'tuition_time_id'
	belongs_to :acd_class_room , :foreign_key => "room_id"
	belongs_to :acd_course_level, :foreign_key => "course_level_id"
	has_many :sdn_class_student , foreign_key:'class_id'
	accepts_nested_attributes_for :sdn_class_student , :allow_destroy => true
	accepts_nested_attributes_for :acd_class_tc_detail , :allow_destroy => true

	has_many :exm_tc_score_master , :foreign_key => "class_id"

	



end
