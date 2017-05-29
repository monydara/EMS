class AddColumnsToAcdCourseFaculty < ActiveRecord::Migration

  def up
    add_column :acd_course_faculties, :description,:text, after: :credit
    add_column :acd_course_faculties, :status,:string, limit:1, default:'A', after: :credit #Status: A=Active, C=Closed
  end

  def down
    remove_column :acd_course_faculties, :description
    remove_column :acd_course_faculties, :status
  end

end
