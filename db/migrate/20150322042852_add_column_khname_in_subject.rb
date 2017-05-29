class AddColumnKhnameInSubject < ActiveRecord::Migration
  def up
  	add_column :acd_subjects , :khr_name , :string
  end
  def down
  	remove_column :acd_subjects , :khr_name
  end
end
