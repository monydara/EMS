class AcdCourseMajor < ActiveRecord::Base
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	belongs_to :acd_major , :foreign_key => "major_id"
end
