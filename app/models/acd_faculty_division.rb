class AcdFacultyDivision < ActiveRecord::Base
	belongs_to :acd_class_division , foreign_key:"division_id"
	belongs_to :acd_standard , foreign_key:'standard_id'
	belongs_to :acd_course_faculty , foreign_key:"course_id"
	belongs_to :acd_degree , foreign_key: "degree_id"
end
