class DegreeCourseIdToAcdCourseSubjects < ActiveRecord::Migration
  def up
    add_column :acd_course_subjects, :degree_course_id, :integer
  end
  def down
    remove_column :acd_course_subjects, :degree_course_id
  end
end
