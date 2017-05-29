class CreateSdnClassTcStudents < ActiveRecord::Migration
  def up
    create_table :sdn_class_tc_students do |t|
    	t.integer :class_id
    	t.integer :student_id
    	t.date    :enroll_date
    	t.integer :enroll_by_id
    	t.integer :campus_id
    	t.boolean :is_del, default: 0
    	t.timestamps
    end
  end

  def down
  	drop_table :sdn_class_tc_students
  end
end
