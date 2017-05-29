class CreateAcdBatchCourses < ActiveRecord::Migration
  def up
    create_table :acd_batch_courses do |t|
      t.integer :batch_id
      t.integer :course_id

      t.timestamps
    end
  end
  def down
  	drop_table :acd_batch_courses
  	
  end
end
