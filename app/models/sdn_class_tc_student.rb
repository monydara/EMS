class SdnClassTcStudent < ActiveRecord::Base
	belongs_to :sdn_student, :foreign_key => "student_id"
	belongs_to :sdn_admission, :foreign_key => "admission_id"  
	belongs_to :acd_class_tc, :foreign_key => "class_id"
end
