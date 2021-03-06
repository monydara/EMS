class CreateAcdCourseLevelTypes < ActiveRecord::Migration
  def up
    create_table :acd_course_level_types do |t|
      t.string :code , limit:6
      t.string :name , limit:50
      t.boolean :is_deleted

      t.timestamps
    end
  end

  def down
  	drop_table :acd_course_level_types
  end
end
