class SdnStudentMovementController < ApplicationController

	@@common = CommonFunction.new

	def index
		condition =" status_type in('S','D','R','A') "

		if !params[:from_date].nil? && !params[:to_date].nil?  &&  !params[:from_date].empty? && !params[:to_date].empty? 
			 
			condition += " AND cast(sdn_status_logs.created_at as date) BETWEEN  '#{params[:from_date]}' AND  '#{params[:to_date]}'  " 
			#condition += " AND sdn_status_logs.created_at  BETWEEN  '#{params[:from_date]}' AND  '#{params[:to_date]}'  "	
		end
		
		if !params[:status].nil? && !params[:status].empty?
			if params[:status] == '0'
				puts("******** yes")
				condition += " AND status_type IN('S','D','R','A') "
			else
				puts("******** no")
				condition += " AND status_type IN('#{params[:status]}') "  ## this can be one of this D,R,A,S
			end
			# condition += " AND status_type IN('#{params[:status]}') "  ## this can be one of this D,R,A,S
		end
		puts condition
		#data = SdnStatusLog.joins(:sdn_student,:sdn_reason_type,:sys_user).where(" status_type in('S','D','R','A')" ).order("sdn_status_logs.id ")
		data = SdnStatusLog.joins(:sdn_student,:sdn_reason_type,:sys_user).where(condition).order("sdn_status_logs.id ")
		
		result = data.select("
							sdn_status_logs.id,
							sdn_students.student_code,
							sdn_students.student_no,
							sdn_students.first_name,
							sdn_students.last_name,
							sdn_students.gender,
							
							sdn_students.campus_id,

							sdn_status_logs.created_at AS created_at_status_log,
							sdn_status_logs.start_date AS effective_date,
							sdn_status_logs.end_date AS end_date,
							sdn_status_logs.student_id,
							sdn_status_logs.admission_id,
							sdn_status_logs.description,
							sdn_status_logs.status_type AS status,
							sdn_status_logs.reason_type_id,
							sdn_reason_types.type_name AS reason_type,
							sys_users.user_name AS status_by")

		puts("********* #{data.count}")
		puts("************ #{condition}")
		render @@common.returnJoinPaginate(data,result,params[:page],params[:limit])
	end

	def create

		begin  # like try-catch block in java
		   
		    SdnStatusLog.transaction do     # anyModelName.transaction           
		       		# Add record to sdn_status_logs table
		       	data = SdnStatusLog.new(:student_id => 	params[:student_id],
		       							:admission_id => params[:admission_id],				
		       							:status_type =>  params[:status_type], 		# D , A , S ,R
		       							:reason_type_id => 1 ,
		       							:start_date => params[:start_date],
		       							:end_date => "#{params[:end_date]}",					# params[:end_date],
		       							:status_by_id => session[:user_id],
		       							:description => params[:description],
		       							:campus_id => session[:campus_id]								
		       							)

		       	
		       	status_type = params[:status_type]
		       	if params[:status_type] == 'R'	### For Reactivate , when save to table student,addmission we show status letter A (Active) , but for status log is R (Reactivate)
		       		status_type = 'A'
		       	end


		       		# Update status in sdn_students table

		       	student = SdnStudent.find(params[:student_id])
		       	student.update_attributes(:status => status_type)

		       		# Update status in sdn_admissions table

		       	student = SdnAdmission.find(params[:admission_id])
		       	student.update_attributes(:status => status_type)


		       	if data.save
		       		render json:{
		       			data: data , success:true
		       		}
		       	else
		       		render json:{
		       			data: data , success:false
		       		}
		       	end
		    
		    end         
		

		rescue Exception => e
		    render json: {
		      message: e.message ,
		      success:false
		    }
		end
		
	end



	def getTypeStudentsList
		condition = 'sdn_students.id!=-1  '
		
		############# For loading student correspond to the button  that user clicked at client (Drop,Suspend,Reactive), so we load the correct data to user. i.e: click Drop => load status that is Active or Suspend 
		if !params[:studentType].nil?
			if params[:studentType].eql?("ActiveSuspend")  # test if 2 strings are equal
				condition += " AND sdn_students.status IN('A','S') AND sdn_admissions.status IN('A','S')"
			elsif params[:studentType].eql?("Active")		# for function drop,suspend
				condition += " AND sdn_students.status IN('A') AND sdn_admissions.status IN('A') "

			elsif params[:studentType].eql?("DropSuspend")  # for function Reactivate
				condition += " AND sdn_students.status IN('D','S') AND sdn_admissions.status IN('D','S')"
			end 
		end

		############# For search keyword 
		if !params[:keyword].nil?
			text = '%'+params[:keyword]+'%'
			condition += " AND (sdn_students.student_no LIKE '#{text}' OR 
						  	   sdn_students.first_name LIKE '#{text}' OR
						       sdn_students.last_name LIKE '#{text}' 
						 )"
		   	  ### we know that, if the user pass keyword ,he must pass status also to identify D,S,A,R
			if params[:status].eql?("ActiveSuspend")  # test if 2 strings are equal
				condition += " AND sdn_students.status IN('A','S') AND sdn_admissions.status IN('A','S')"
			elsif params[:status].eql?("Active")		# for function drop,suspend
				condition += " AND sdn_students.status IN('A') AND sdn_admissions.status IN('A') "

			elsif params[:status].eql?("DropSuspend")  # for function Reactivate
				condition += " AND sdn_students.status IN('D','S') AND sdn_admissions.status IN('D','S')"
			end 
		end
		puts("****************** #{condition}")

		data = SdnStatusLog.joins(:sdn_student,
								  :sdn_admission=>[:acd_degree,:acd_course_faculty,:cfg_academic_year,:acd_class_shift])
							.where(condition) 
				
		result = data.select("
								sdn_students.id,
								sdn_students.student_code,
								sdn_students.student_no,
								sdn_students.first_name,
								sdn_students.last_name,
								sdn_students.gender,
								sdn_students.status ,
								sdn_students.campus_id,

								sdn_admissions.degree_id , 
								sdn_admissions.course_id,
								sdn_admissions.start_acd_year_id,
								sdn_admissions.class_shift_id,

								cfg_academic_years.name AS academic_year,
																
								acd_degrees.name degree,
								acd_course_faculties.name course,
								acd_class_shifts.name shift_name ,

								sdn_status_logs.student_id AS student_id,
								sdn_status_logs.admission_id AS admission_id 
							") 

		render @@common.returnJoinPaginate(data,result,params[:page],params[:limit])

		# data = SdnStatusLog.joins(:sdn_student,:sdn_admission ,

		# 							"left join acd_degrees d on sdn_admissions.degree_id=d.id left join acd_course_faculties c on sdn_admissions.course_id=c.id"
		# 							#"left join acd_course_faculties c on sdn_admissions.course_id=c.id"
		# 						).select("sdn_students.* , 
		# 												sdn_admissions.id AS admission_id,
		# 												sdn_admissions.degree_id , 
		# 												sdn_admissions.course_id,
		# 												sdn_admissions.start_acd_year_id,
		# 												sdn_admissions.class_shift_id,
		# 													d.name degree ,
		# 													c.name course
		# 												")

	end


	def getReasonType

		condition = ''
		if !params[:reason].nil?
			reason = params[:reason]
			condition += "reason_for IN('#{reason}')"
		end

		data = SdnReasonType.where(condition)
		result = data.select("*")
		render @@common.returnJoinPaginate(data,result,params[:page],params[:limit])
	
	end





	
end
