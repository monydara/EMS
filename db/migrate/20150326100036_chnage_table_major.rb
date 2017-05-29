class ChnageTableMajor < ActiveRecord::Migration
  
  def up
  	 remove_column :acd_majors , :acd_course_id
  	 remove_column :acd_majors , :sys_user_id	
  	 add_column :acd_majors , :khr_name , :string 
  	 add_column :acd_majors, :campus_id , :integer
  end

  def down
	add_column :acd_majors , :acd_course_id , :integer
  	add_column :acd_majors , :sys_user_id	, :integer
  	remove_column :acd_majors , :khr_name 
  	remove_column :acd_majors, :campus_id 
  end
end
