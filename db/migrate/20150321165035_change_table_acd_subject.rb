class ChangeTableAcdSubject < ActiveRecord::Migration
  def up
  	remove_column :acd_subjects , :acd_subject_type_id
  	remove_column :acd_subjects , :credit
  	remove_column :acd_subjects , :is_no_exam
  	remove_column :acd_subjects , :is_deleted
  	remove_column :acd_subjects , :created_by
  end

  def down
  	add_column :acd_subjects , :acd_subject_type_id , :integer
  	add_column :acd_subjects , :credit , :integer
  	add_column :acd_subjects , :is_no_exam , :boolean
  	add_column :acd_subjects , :is_deleted , :boolean
  	add_column :acd_subjects , :created_by , :integer
  end
end
