class ChangelegnthStudentNo < ActiveRecord::Migration
  def up
  	remove_column :sdn_students , :student_no  
  	add_column :sdn_students , :student_no , :string , limit:13 , after: :student_code
  end

  def down
  	
  end
end
