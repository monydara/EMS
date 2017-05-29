class AcdBatchCourse < ActiveRecord::Base
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	belongs_to :acd_batch , :foreign_key => "batch_id"
end
