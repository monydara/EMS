class SdnStudent::Admission
	def is_admission_duplicate admission
		 
		@data = SdnAdmission.where degree_id:admission.degree_id , batch_id:admission.batch_id , course_id:admission.course_id , student_id:admission.student_id
		
		if @data.count> 0 
			return true 
		else 
			return false
		end

		
	end
	
end