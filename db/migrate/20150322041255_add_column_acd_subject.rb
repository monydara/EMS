class AddColumnAcdSubject < ActiveRecord::Migration
  def up
  	add_column :acd_subjects, :subject_type_id , :integer
  	add_column :acd_subjects , :campus_id ,:integer
  	add_column :acd_subjects , :is_deleted ,:boolean
  end

  def down
  	remove_column :acd_subjects, :subject_type_id 
  	remove_column :acd_subjects , :campus_id 
  	remove_column :acd_subjects , :is_deleted 

  	
  end
end
