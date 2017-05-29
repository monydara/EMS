class CreateAcdDegreeCourses < ActiveRecord::Migration
  def up
    create_table :acd_degree_courses do |t|
      t.integer :degree_id
      t.integer :course_id

      t.timestamps
    end
  end

  def down
  	drop_table :acd_degree_courses
  end
end
