class AddColumnsToSdnStudentKhr < ActiveRecord::Migration
  def up
    add_column :sdn_student_khrs, :diploma_grade, :string, :limit=>1, after: :diploma_year
    add_column :sdn_student_khrs, :is_passed_diploma, :boolean, after: :diploma_grade
  end
  def down
    remove_column :sdn_student_khrs,:diploma_grade
    remove_column :sdn_student_khrs,:is_passed_diploma
  end
end
