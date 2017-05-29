class CreateAcdCourseBooks < ActiveRecord::Migration
  def up
    create_table :acd_course_books do |t|
      t.string      :book_code, limit:6, null:false
      t.string      :book_name, limit:50, null:false
      t.string      :author, limit:50
      t.text        :description
      t.string      :status, limit:1, default:'A' #A=Active, C=Closed
      t.boolean     :is_deleted, default:false
      t.integer     :campus_id
      t.timestamps
    end
  end
  def down
      drop_table  :acd_course_books
  end
end
