class CreateAcdClassWus < ActiveRecord::Migration
  def up
    create_table :acd_class_wus do |t|
      t.string :class_code , :limit => 6
      t.string :class_name , :limit => 100
      t.string :program_type , :limit => 1 , :comment => "N=National Program ; I=International"
      t.integer :degree_id
      t.integer :course_id
      t.integer :standard_id
      t.integer :division_id
      t.integer :academic_year_id
      t.integer :room_id
      t.integer :class_shift_id
      t.boolean :is_gpa
      t.integer :credit
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :status , :limit => 1, :comment => "S=Started, F=Finished, C=Cancel, P=Pending"
      t.integer :campus_id

      t.timestamps
    end
  end

  def down
    drop_table :acd_class_wus
  end
end
