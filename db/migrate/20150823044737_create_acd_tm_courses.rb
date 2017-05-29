class CreateAcdTmCourses < ActiveRecord::Migration
  def up
    create_table :acd_tm_courses do |t|
      t.string :code, limit:6, null:false
      t.string :name, limit:100, null:false
      t.string :khr_name, limit:100
      t.string :abbr, limit:3, null:false
      t.integer :degree_id
      t.text    :description
      t.string :status, limit:1, default:'A' # A=Active, C=Closed
      t.boolean :is_deleted, default:false
      t.integer :campus_id
      t.timestamps
    end
  end
  def down
    drop_table :acd_tm_courses
  end
end
