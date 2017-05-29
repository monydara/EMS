class SdnAdmission < ActiveRecord::Base	
	belongs_to :sdn_student , :foreign_key=>"student_id"
	belongs_to :acd_degree , :foreign_key => "degree_id"  # for student movement
	belongs_to :acd_batch , :foreign_key => "batch_id"
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	# belongs_to :acd_class_shift , :foreign_key => "class_shift_id"
	has_many :sdn_fee_charge , :foreign_key => "admission_id"
	
	
	belongs_to :acd_term , :foreign_key => "term_id"

		# for student movement
	has_many :sdn_status_log , :foreign_key => "admission_id"
	belongs_to :cfg_academic_year , :foreign_key => "start_acd_year_id"
	belongs_to :acd_class_shift  , :foreign_key => "class_shift_id"
	
	
end
