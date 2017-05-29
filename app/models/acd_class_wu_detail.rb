class AcdClassWuDetail < ActiveRecord::Base
	belongs_to :acd_class_wu , :foreign_key => "class_wu_id"
	belongs_to :acd_class_division , :foreign_key => "division_id"
	belongs_to :acd_subject , :foreign_key => "subject_id"
	belongs_to :hr_employee , :foreign_key => "lecturer_id"
end
