class CreateAcdMajors < ActiveRecord::Migration
  def up
    create_table :acd_majors do |t|
      t.string :code
      t.string :name
      t.integer :acd_course_id
      t.boolean :is_deleted
      t.integer :sys_user_id

      t.timestamps
    end
  end

  def down
    drop_table :acd_majors
  end
end
