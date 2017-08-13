class AcdRelCoursesSubject < ActiveRecord::Base
  belongs_to :acd_tm_course,foreign_key:'course_id'
  belongs_to :acd_subject,foreign_key:'subject_id'
end
