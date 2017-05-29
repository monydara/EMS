class AddNewColumnToCourseFaculty < ActiveRecord::Migration
  def up
  	add_column :acd_course_faculties , :campus_id , :integer
  end

  def down
  	remove_column :acd_course_faculties , :campus_id 
  end

end
