class SdnStudent::ActiveStudent
	
	def check_is_complete_admision_info admission_id 
		@admission = SdnAdmission.find admission_id
		if @admission.admission_date.nil?
			false 
		else
			true
		end

	end


end