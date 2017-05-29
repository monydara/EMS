class AddFieldToSubjectType < ActiveRecord::Migration
  def up
  	add_column :acd_subject_types , :code , :string , limit:6 , after: :name
  	add_column :acd_subject_types , :khr_name , :string , limit:50 , after: :name
  end
  def down
  	remove_column :acd_subject_types , :code
  	remove_column :acd_subject_types , :khr_name
  end
end
