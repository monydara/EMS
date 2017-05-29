class AcdCourseLevel < ActiveRecord::Base
	belongs_to :acd_course_level_type , foreign_key:'level_type_id'
	belongs_to :acd_course_faculty , foreign_key:'course_id'
	belongs_to :acd_class_tc , foreign_key:'course_id'
end
