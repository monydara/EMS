class Acc::AccountMaster
	def get_data params
		data = Hash.new()
		data["model"] = AccAccountMaster.joins(sdn_admission:[:acd_course_faculty , :acd_degree, :sdn_student]).joins("left join acc_cycle_types on acc_cycle_types.id = acc_account_masters.cycle_type_id")
		
		data["result"] =data["model"].select("acc_account_masters.* , 
			sdn_admissions.admission_no , acc_cycle_types.cycle_name ,
			acd_course_faculties.name course_name, 
			acd_degrees.name degree_name, 
			sdn_students.student_no , 
			sdn_students.date_of_birth,
			concat(sdn_students.first_name,' ',sdn_students.last_name) student_name")

		data
	end
end