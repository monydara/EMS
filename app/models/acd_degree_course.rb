class AcdDegreeCourse < ActiveRecord::Base
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	belongs_to :acd_degree , :foreign_key => "degree_id"
end
