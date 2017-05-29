class RemoveColumnsSdnStudentRequest < ActiveRecord::Migration
  def change
      remove_column :sdn_student_requests, :charge_item_id
      remove_column :sdn_student_requests, :charge_amount
      remove_column :sdn_student_requests, :degree_id
      remove_column :sdn_student_requests, :course_id
      remove_column :sdn_student_requests, :academic_year_id
      remove_column :sdn_student_requests, :class_shift_id
  end
end
