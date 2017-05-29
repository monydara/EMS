class AcdSubject < ActiveRecord::Base

	belongs_to :acd_subject_type , :foreign_key => "subject_type_id"
	has_many :acd_course_subject , :foreign_key => "acd_subject_id"
	has_many :acd_class_tc_detail , :foreign_key => "subject_id"
	has_many :acd_class_wu_detail , :foreign_key => "subject_id"

	has_many :exm_tc_score_master , :foreign_key => "subject_id"
end
