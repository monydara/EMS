module AcdFacultySubjectDetailsHelper
	def self.get_data params , campus_id
		degree_id = params[:degree_id]
        course_id = params[:course_id]
        standard_id = params[:standard_id]
        division_id = params[:division_id]
        
		data = []  
		if  !degree_id.nil? && !course_id.nil? && !standard_id.nil? && !division_id.nil?
			data = AcdFacultySubjectDetail.where(
				degree_id:degree_id,
				course_id:course_id,
				standard_id:standard_id,
				division_id:division_id, 
				campus_id:campus_id , 
				is_deleted:false 
			).joins(:acd_subject).select("acd_faculty_subject_details.* , acd_subjects.name  ")
		end
			
		data 
	end
end
