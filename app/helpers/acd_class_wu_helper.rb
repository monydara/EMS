module AcdClassWuHelper
	def self.get_class(class_code)
		if !class_code.nil? && !class_code.empty?
			data = AcdClassWu.where(class_code:class_code)
			result= data.joins(:cfg_academic_year,:acd_standard,
				:acd_class_shift,:acd_class_division,:acd_class_room).select("
	 				acd_class_wus.*, 
	 				cfg_academic_years.name academic_year, 	 				
	 				acd_class_shifts.name session, 
	 				acd_class_rooms.name class_room,  				
	 				acd_class_divisions.name division_name, 
	 				acd_standards.name standard 

			")
		else 
			result =[]
		end
		

		return result 
	end
end
