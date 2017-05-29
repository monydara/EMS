module ExmAttendanceRecordHelper

	def self.getDataDetail params   # self means this keyword
		id = params[:id]
		class_id = params[:class_id]
		data = [] 

		if id.nil?	# add
			data = get_detail_new class_id	
		else 		# edit			
			data = get_dtail_edit id
		end
		data  	# return data to the function call
	end


	def self.get_detail_new class_id
		data  =SdnClassStudent.joins(:sdn_student).select("
					
					sdn_students.id student_id ,
					sdn_students.student_no , 
					sdn_students.gender,
					sdn_students.first_name , 
					sdn_students.last_name
				").where("sdn_class_students.class_id = #{class_id} ")
		data 
		
	end
	def self.get_dtail_edit id
		data  =SdnClassStudent.joins( " 
				left join exm_tc_attendance_details e on e.student_id = sdn_class_students.id ")
			.joins(:sdn_student).select("
					e.id  , 
					sdn_students.id student_id ,
					sdn_students.student_no , 
					e.status,
					sdn_students.gender,

					sdn_students.first_name , 
					sdn_students.last_name
				").where(" e.attendance_id = #{id}")	
		data
	end

	

	def self.getCondition params
		
		condition = "hr_employees.id!=-1 AND exm_tc_attendances.is_deleted=0 "
	
		if !params[:text].nil?
			text = '%'+params[:text]+'%'
			condition += " AND (acd_subjects.name LIKE '#{text}' 
						OR acd_course_levels.name LIKE '#{text}' 
						OR acd_class_rooms.name LIKE '#{text}' 
						OR acd_course_faculties.name LIKE '#{text}' 
						OR hr_employees.name LIKE '#{text}' 
						OR acd_tuition_times.tuition_name LIKE '#{text}' 
						OR acd_class_tcs.class_name LIKE '#{text}'
						) " 
			
			
		end
			# Advance search
		room_id = params[:room_id]
		subject_id = params[:subject_id]
		teacher_id = params[:teacher_id]
		level_id = params[:level_id]
		shift_id = params[:shift_id]
		assessment_id = params[:assessment_id]
		from_date = params[:from_date]
		to_date = params[:to_date]

		if !room_id.nil? && !room_id.empty?
		    condition += " AND acd_class_rooms.id=#{room_id}"
		end
		if !subject_id.nil? && !subject_id.empty?
		    condition += " AND acd_subjects.id=#{subject_id}"
		end
		if !teacher_id.nil? && !teacher_id.empty?
		    condition += " AND hr_employees.id=#{teacher_id}"
		end
		if !level_id.nil? && !level_id.empty?
		    condition += " AND acd_course_levels.id=#{level_id}"
		end
		if !shift_id.nil? && !shift_id.empty?
		    condition += " AND acd_class_shifts.id=#{shift_id}"
		end
		
		if !from_date.nil? && !to_date.nil?  &&  !from_date.empty? && !to_date.empty?             
		    condition += "  AND  (exm_tc_attendances.record_date BETWEEN '#{from_date}' AND '#{to_date}')  "
		end


		condition
	end


	def self.getSelectField data
		result = data.select("hr_employees.name AS teacher,	    					
	    					 exm_tc_attendances.record_date,
	    					 acd_course_faculties.name AS course,
	    					 acd_subjects.name AS subject,
	    					 acd_class_rooms.name AS class_room,
	    					 cfg_academic_years.name AS academic_year,	    					
	    					 acd_terms.term_name AS term,
							 exm_tc_attendances.*,	    					
	    					 acd_class_rooms.id AS room_id,
	    					 acd_class_shifts.name 'session',
	    					 acd_course_levels.name 'course_level',
	    					 acd_tuition_times.tuition_name ,	    					
	    					
							 acd_class_tcs.class_name ")  # if we rename this class_name, it will cause SystemStackError because we join it with many other table

		result = result.order(:record_date => :desc )
		result
	end
end
