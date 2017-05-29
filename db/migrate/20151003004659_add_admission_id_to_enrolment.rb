class AddAdmissionIdToEnrolment < ActiveRecord::Migration
  def up
    add_column :sdn_class_students,:admission_id,:integer, after: :student_id
    add_column :sdn_class_tc_students,:admission_id,:integer, after: :student_id
  end

  def down
    remove_column :sdn_class_students,:admission_id
    remove_column :sdn_class_tc_students,:admission_id
  end
end
