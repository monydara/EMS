class ChangeTableCourseFaculty < ActiveRecord::Migration
  def up
  	remove_column :acd_course_faculties , :program_type
  	add_column :acd_course_faculties , :khr_name , :string
  end
  def down
  	add_column :acd_course_faculties, :program_type , :string
  	remove_column :acd_course_faculties , :khr_name 
  end
end
