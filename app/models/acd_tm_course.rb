class AcdTmCourse < ActiveRecord::Base
  has_many :acd_rel_courses_subject, foreign_key: 'course_id'
  belongs_to :acd_degree, foreign_key:'degree_id'
end
