class AddColumnsTotalScoreSdnStudentKhr < ActiveRecord::Migration
  def up
    add_column :sdn_student_khrs, :total_score, :integer, default: 0,after: :diploma_grade
  end
  def down
    remove_column :sdn_student_khrs, :total_score, :integer
  end
end
