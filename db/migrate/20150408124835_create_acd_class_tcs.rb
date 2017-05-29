class CreateAcdClassTcs < ActiveRecord::Migration
  def up
    create_table :acd_class_tcs do |t|
      t.string :class_code , :limit => 6
      t.string :class_name , :limit => 100
      t.integer :degree_id
      t.integer :course_id
      t.integer :academic_year_id
      t.integer :term_id
      t.integer :room_id
      t.integer :course_level_id
      t.integer :tuition_time_id
      t.integer :session_id
      t.date :start_date
      t.date :end_date
      t.datetime :study_start_time
      t.text :description
      t.string :status , :limit => 1 , :comment => "S=Started, F=Finished, C=Cancel, P=Pending"
      t.integer :campus_id

      t.timestamps
    end
  end
  def down
    drop_table :acd_class_tcs
  end
end
