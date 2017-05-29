class CreateAcdCourseFaculties < ActiveRecord::Migration
  def up
    create_table :acd_course_faculties do |t|
      t.string :code ,:limit => 6
      t.string :abbr , :limit => 3
      t.string :name , :limit => 50
      t.string :course_type , :limit => 2
      t.string :program_type ,:limit => 1
      t.integer :credit
      t.boolean :is_deleted

      t.timestamps
    end
  end
  def down
    drop_table :acd_course_faculties
  end
end
