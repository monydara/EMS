class CreateAcdCourseSubjects < ActiveRecord::Migration
  def up
    create_table :acd_course_subjects do |t|
      t.integer :acd_course_id
      t.integer :acd_subject_id

      t.timestamps
    end
  end

  def down
  	drop_table :acd_course_subjects
  end
end
