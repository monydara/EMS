class CreateSdnAdmissionHistories < ActiveRecord::Migration
  def up
    create_table :sdn_admission_histories do |t|
    	t.integer :student_id
    	t.integer :admission_id
    	t.string	:program_type, limit:1, default:"N" # N=National Program, I=International Program
    	t.integer :batch_id
    	t.integer :degree_id
    	t.integer :course_id
    	t.integer :class_shift_id
    	t.integer :major_id
    	t.integer :start_acad_year_id
    	t.integer :current_acad_year_id
    	t.text	:note
      t.timestamps
    end
  end

  def down
  	drop_table :sdn_admission_histories

  end
end
