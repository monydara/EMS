class AcdFacultySubjectDetail < ActiveRecord::Base
	belongs_to :acd_subject , foreign_key:"subject_id"
end
