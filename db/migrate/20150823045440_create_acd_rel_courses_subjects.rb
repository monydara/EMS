class CreateAcdRelCoursesSubjects < ActiveRecord::Migration
  def up
    create_table :acd_rel_courses_subjects do |t|
      t.integer :course_id
      t.integer :subject_id
      t.timestamps
    end
  end
  def down
    drop_table :acd_rel_courses_subjects
  end
end
