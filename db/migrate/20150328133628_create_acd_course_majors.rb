class CreateAcdCourseMajors < ActiveRecord::Migration
  def up
    create_table :acd_course_majors do |t|
      t.integer :major_id
      t.integer :course_id
      t.boolean :is_default

      t.timestamps
    end
  end

  def down
  	drop_table :acd_course_majors
  end
end
