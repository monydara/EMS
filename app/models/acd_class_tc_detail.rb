class AcdClassTcDetail < ActiveRecord::Base
	belongs_to :acd_class , :foreign_key => "class_tc_id"
	belongs_to :acd_subject , :foreign_key => "subject_id"
	belongs_to :hr_employee , :foreign_key => "lecture_id"
end
