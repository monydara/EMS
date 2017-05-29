class AcdMajor < ActiveRecord::Base
	has_many :acd_course_major , :foreign_key => "major_id"
end
