class AddadmissionIdAndRemoveStudentIdFromSdnSudentPromote < ActiveRecord::Migration
  def up
  	add_column :sdn_student_promotes , :admission_id , :integer , after: :id 
  	remove_column :sdn_student_promotes , :student_id 
  end
end
