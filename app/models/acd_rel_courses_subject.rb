class AcdRelCoursesSubject < ActiveRecord::Base
  belongs_to :acd_tm_course,foriegn_key:'course_id'
  belongs_to :acd_subject,foriegn_key:'subject_id'
end
