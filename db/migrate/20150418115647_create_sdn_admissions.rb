class CreateSdnAdmissions < ActiveRecord::Migration
  def up
    create_table :sdn_admissions do |t|
      t.integer :student_id
      t.string	:admission_no, limit:30
      t.date 	  :admission_date
      t.integer	:admission_by_id
      t.string	:admission_type, limit:1, default:"N" # N=Normal, T=Transfer, S=Scholarship
      t.string	:program_type, limit:1, default:"N", null:false #N=Local Program, I=International Program
      t.integer	:batch_id
      t.integer :degree_id
      t.integer :course_id
      t.integer	:class_shift_id
      t.integer :major_id
      t.integer :start_acd_year_id
      t.integer	:end_acd_year_id
      t.text	  :note
      t.string	:status, limit:1, default:"N", null:false #N=New, A=Active, C=Cancel
      t.integer :campus_id
      
      t.timestamps
    end
  end

  def down
  	drop_table :sdn_admissions
  end
end
