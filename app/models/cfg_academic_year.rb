class CfgAcademicYear < ActiveRecord::Base
	has_many :acd_class_tc , :foreign_key => "academic_year_id"
	has_many :acd_class_wu , :foreign_key => "academic_year_id"
	has_many :hr_holiday , :foreign_key => "academic_year_id"

		#Student movement
	belongs_to :sdn_admission , :foreign_key => "start_acd_year_id"
end
