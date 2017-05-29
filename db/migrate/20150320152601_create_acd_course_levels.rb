class CreateAcdCourseLevels < ActiveRecord::Migration
  def up
    create_table :acd_course_levels do |t|
      t.string :code
      t.string :name
      t.integer :course_id
      t.integer :level_type_id

      t.timestamps
    end
  end

  def down
  	drop_table :acd_course_levels
  end
end
