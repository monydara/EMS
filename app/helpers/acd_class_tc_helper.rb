module AcdClassTcHelper
	def self.get_class(class_code)
		if !class_code.nil? && !class_code.empty?
			data = AcdClassTc.where(class_code:class_code)
			result= data.joins(:cfg_academic_year,
				:acd_course_faculty,:acd_term,:acd_class_shift,
				:acd_tuition_time,:acd_class_room,:acd_course_level).select("
	 				acd_class_tcs.*, 
	 				cfg_academic_years.name academic_year, 
	 				acd_course_faculties.name course, 
	 				acd_terms.term_name term,
	 				acd_class_shifts.name session, 
	 				acd_tuition_times.tuition_name tuition_name,
	 				acd_class_rooms.name class_room, 
	 				acd_course_levels.name course_level
			")
		else 
			result =[]
		end
		

		return result 
	end
end
