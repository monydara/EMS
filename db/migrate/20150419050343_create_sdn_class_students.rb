class CreateSdnClassStudents < ActiveRecord::Migration
  def up
    create_table :sdn_class_students do |t|
    	t.integer :class_id
    	t.integer :student_id
    	t.string :degree_type, limit:2, default:"WU" # WU=Western University, TC=Training Center
    	t.date :enroll_date
    	t.integer :enroll_by_id
    	t.integer :campus_id
    	t.boolean :is_del, default:false
    	
      t.timestamps
    end
  end

  def down
  	drop_table :sdn_class_students
  end
end
