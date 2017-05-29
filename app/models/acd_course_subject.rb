class AcdCourseSubject < ActiveRecord::Base
	belongs_to :acd_course_faculty , :foreign_key => "acd_course_id"
	belongs_to :acd_subject , :foreign_key => "acd_subject_id"
end
