class AddColumnsToStudent < ActiveRecord::Migration
  def up
  	add_column :sdn_students, :student_code,:string, limit:50, after: :title_id
  	add_column :sdn_students, :student_no,:string, limit:9, after: :student_code
  end

  def down
  	remove_column :sdn_students, :student_code
  	remove_column :sdn_students, :student_no
  end
end
