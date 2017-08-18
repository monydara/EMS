class SdnStudentController < ApplicationController
	@@image_url =""
	@@common =CommonFunction.new


	def index


		puts "======= test"
		data = SdnStudent
		if !params[:string].nil?
			string = "%"+params[:string]+"%"

			data = data.where(" student_code like '#{string}' or student_no like '#{string}' or
			 first_name like '#{string}' or last_name like '#{string}' or khr_first_name like '#{string}' or khr_last_name like '#{string}' or phone like '#{string}' ")

		end

		if !params[:status].nil?
			data = data.where(" sdn_students.status = 'A' ")
		end
		@conditon_string = SdnStudentHelper.get_string_advance_search params
		data = data.where(" sdn_students.campus_id = #{session[:campus_id]} #{@conditon_string}")

		result = data.select("  sdn_students.*


			")
			# .joins(" left join sdn_city_states on sdn_city_states.id = sdn_students.from_city_id
			# 	left join sdn_admissions on sdn_admissions.student_id = sdn_students.id
			# 	left join sdn_student_khrs on sdn_student_khrs.student_id = sdn_students.id
			# ")
		render @@common.returnJoinPaginate(  data, result, params[:page],params[:limit])
	end
	def get_student
		id = params[:student_id]
		if !id.nil?
			@data = SdnStudent.find id
			render json:{ data:@data , success:true }
		else
			render json:{ success:false , message:"Cannot find student without id  "}
		end


	end



	def uploadImage
    begin
      @image = Image.new(permit_image)
      @image.save

      @@image_url = @image.image.url
      render json:{ data:@image.image.url , success:true }
    rescue Exception => e
      render json:{ success:false , message:e.message}
      end

	end

	def create
		@service = SdnStudent::Admission.new
		SdnStudent.transaction do
    #puts  'begin'

		studentInfo = SdnStudent.new(permit_data_student)
	    student_id =  params[:data]["student_id"]

	    if student_id.nil? || student_id.empty?


	      if studentInfo.lead_id.nil?
	      	puts "======== new student "
	        studentInfo.status = "N"
	        studentInfo.handler =params[:data]["type"].to_s
	        studentInfo.campus_id = session[:campus_id]
	        studentInfo.registered_date = DateTime.now
	        studentInfo.save
	      else
	      	puts "========== student the same lead #{studentInfo.lead_id.nil?}"
     			@LeadData=SdnStudent.find_by lead_id:studentInfo.lead_id
					if !@LeadData.nil?
						studentInfo = SdnStudent.find data.
						studentInfo.update_attributes(permit_data_student)
					else
						studentInfo.status = "N"
						 studentInfo.handler =params[:data]["type"].to_s
						 studentInfo.campus_id = session[:campus_id]
						 studentInfo.registered_date = DateTime.now
						 studentInfo.save
					end

	      end

	    else
	      studentInfo = SdnStudent.find student_id
	      studentInfo.update_attributes(permit_data_student)
	    end

	    # ===========contact block
	    #
	    #check Emergency contact
	    if SdnStudentHelper.check_exist_student_contact(studentInfo.id , "E") == true
	      emergencyContact = SdnStudentHelper.get_tmp_contact
	      emergencyContact.update_attributes(permit_data_emergency_contact)
	    else
	      emergencyContact = SdnContact.new(permit_data_emergency_contact)
	      emergencyContact.student_id = studentInfo.id
	      emergencyContact.contact_type = "E"
	      emergencyContact.save
	    end

	    #check Father contact
	    if SdnStudentHelper.check_exist_student_contact(studentInfo.id , "F") == true
	      fatherContact = SdnStudentHelper.get_tmp_contact
	      fatherContact.update_attributes(permit_data_father_contact)
	    else
	      fatherContact = SdnContact.new(permit_data_father_contact)
	      fatherContact.student_id = studentInfo.id
	      fatherContact.contact_type = "F"
	      fatherContact.gender = 'M'
	      fatherContact.save
	    end

	    #check Mother contact
	    if SdnStudentHelper.check_exist_student_contact(studentInfo.id , "M") == true
	      motherContact = SdnStudentHelper.get_tmp_contact
	      motherContact.update_attributes(permit_data_mother_contact)
	    else
	      motherContact = SdnContact.new(permit_data_mother_contact)
	      motherContact.student_id = studentInfo.id
	      motherContact.contact_type = "M"
	      motherContact.gender = "F"
	      motherContact.save
	    end

	    	# student admission
				admission = SdnAdmission.new(permit_data_addmission)
				admission.student_id = studentInfo.id
				admission.campus_id = session[:campus_id]
	  			admission.program_type = 'N'
				admission.admission_by_id = session[:user_id]
				admission.c_level_id = admission.s_level_id
				admission.status ="N"
				if @service.is_admission_duplicate(admission) == false
					admission.save
				else
					render json:{ success:false , message:'Admission already exist. Please re-check admission info'}
					raise ActiveRecord::Rollback
					return 0
				end

				studentLog = SdnStatusLog.new()
				studentLog.student_id = studentInfo.id
				studentLog.admission_id = admission.id
				studentLog.status_type = "N"
				studentLog.start_date = DateTime.now
				studentLog.status_by_id = session[:user_id]
				studentLog.campus_id = session[:campus_id]
				studentLog.save


				# update id field relate with session
				SdnStudentHelper.check_student_account studentInfo,  session[:campus_id]

				# SdnDocument.where(tmp_emp_id:session[:user_id]).update_all(student_id:studentInfo.id, tmp_emp_id:nil)

				if params[:data]["type"].to_s == "WU"
					SdnStudentHelper.save_student_khr(studentInfo.id ,data_permit_student_khr )
				end


				if studentInfo.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'Student',"create Student =   #{studentInfo.first_name} #{studentInfo.last_name}"," #{params}");
					render json:{ data:studentInfo , success:true }
				else
					render json:{ error:studentInfo.errors , success:false }
	      end

		end

	end

	def update
		begin
			SdnStudent.transaction do

				if !params[:data]["admissionModel"].nil? && !params[:data]["admissionModel"].empty?

					admission_id = params[:id]
					admission = SdnAdmission.find admission_id
					admission.update_attributes(permit_data_addmission)
					student_id = admission.student_id
				else

					student_id = params[:id]
				end


				studentInfo = SdnStudent.find(student_id)

				studentInfo.update_attributes(permit_data_student)
				# contact information
				emergencyContact = SdnContact.find_by student_id:studentInfo.id, contact_type:"E"
				if !emergencyContact.nil?
						emergencyContact = emergencyContact.update_attributes(permit_data_emergency_contact)
				end

				fatherContact = SdnContact.find_by student_id:studentInfo.id , contact_type:"F"
				if !fatherContact.nil?
					fatherContact.update_attributes(permit_data_father_contact)
				end

				motherContact = SdnContact.find_by student_id:studentInfo.id , contact_type:"M"
				if !motherContact.nil?
					motherContact.update_attributes(permit_data_mother_contact)
				end

				# feeCharge = SdnFeeCharge.find_by student_id:student_id
				# feeCharge.update_attributes(permit_data_fee_charge)
				if params[:data]["type"].to_s == "WU"
						dataStudent = SdnStudentKhr.find_by student_id:studentInfo.id
						dataStudent.update_attributes(data_permit_student_khr)
				end

				SdnDocument.where(tmp_emp_id:session[:user_id]).update_all(student_id:studentInfo.id, tmp_emp_id:nil)

				auditrail =AuditialController.new
				auditrail.create( session[:user_id] , 'Update', 'Student',"update Student =   #{studentInfo.first_name} #{studentInfo.last_name}"," #{params}")

				render json:{ id:student_id , success:true}
			end
		rescue Exception => e

			render json:{message:e.message , success:false}
		end
	end

	def close_student
		begin
			if !params[:student_id].nil?

				data = SdnStudent.find params[:student_id]
				data.update_attributes( record_stat:'C')
				data.sdn_admission.update_all(record_stat:'C')
				auditrail =AuditialController.new
				auditrail.create( session[:user_id] , 'Update', 'Student',"Close  Student =   #{data.first_name} #{data.last_name}"," #{params}")
				render json:{ data: data , success:true}
			else
				render json:{ success:false , message:'Can not update student with id nil '}
			end
		rescue Exception => e
			render json:{message:e.message , success:false}
		end


	end
	def open_student
		begin
			if !params[:student_id].nil?

				data = SdnStudent.find params[:student_id]
				data.update_attributes( record_stat:'O')
				data.sdn_admission.update_all(record_stat:'O')
				auditrail =AuditialController.new
				auditrail.create( session[:user_id] , 'Update', 'Student',"Re-open Student =   #{data.first_name} #{data.last_name}"," #{params}")
				render json:{ data: data , success:true}
			else
				render json:{ success:false , message:'Can not update student with id nil '}
			end
		rescue Exception => e
			render json:{message:e.message , success:false}
		end


	end

	def active_student
		begin
			@service = SdnStudent::ActiveStudent.new
			admission_id = params[:admission_id].to_i
			# admission can not active if not yet complete information
			if @service.check_is_complete_admision_info( admission_id ) == true

				result = active_student_service()
				if result == false
					render json:{ error:"Can Not Ative Student " , success:false}
				else
					render json:{ data:result , success:true , message:'Ative Student Success'}
				end

			else
				render json:{ success:false , message:'Please update more information of admission before active'}
			end


		rescue Exception => e
			puts e.message
			render json:{success:false , message:'Active student problem. Please contact to admin' , error:e.message}
		end

	end
	def active_student_wu
		result = active_student_wu_service()
		if result == false
			render json:{ error:"Can Not Ative Student " , success:false}
		else
			render json:{ data:result , success:true , message:'Ative Student Success'}
		end
	end
	def cancel_student
		begin
			result = cancel_student_service()
			if result == false
				render json:{ error:"Can Not Cancel Student " , success:false}
			else
				render json:{ data:result , success:true , message:'Cancel Student Success'}
			end
		rescue Exception => e
				render json:{ message:e.message , success:false}

		end

	end
	# def method_name
	# end

	def addDocument
		data = SdnDocument.new(permit_data_document)
		data.tmp_emp_id = session[:user_id]
		data.save
		if data.valid?
			data.update_attributes( file_path:data.avatar.url)
			render json:{ data:data, success:true}
		else
			render json:{ error:data.errors, success:false}

		end
	end

	def getDocument
		admission_id = params[:admission_id]
		if !admission_id.nil?
			@admission = SdnAdmission.find admission_id
			student_id = @admission.student_id

			data = SdnDocument.joins(:sdn_document_type).where("(student_id = #{student_id} or tmp_emp_id = #{session[:user_id]}) and is_del = false " )
			data = data.select("sdn_documents.* , sdn_document_types.type_name doc_type")
		else
			data = SdnDocument.where("tmp_emp_id = #{session[:user_id]} and is_del = false" )
		end
		render json:{ data:data , success:true}
	end

	def removeDocument
		if !params[:id].nil?
			data = SdnDocument.find(params[:id])
			data.update_attributes(is_del:true)
			if data.valid?
				render json:{ data:data , success:true, message:"Delete Success"}
			else
				render json:{ data:data , success:false}
			end
		end
	end

	private


	def active_student_service

		result = false
		if !params[:admission_id].nil?
			SdnStudent.transaction do
				time = Time.now


				# ====== new update (2015-09-16) student_id is admission id
				admission = SdnAdmission.find params[:admission_id]
				@student = SdnStudent.find admission.student_id

				# === end
				if @student.student_no.nil? || @student.student_no.empty?

					student_no =@@common.getNextCode("STUDENT_NO", session[:campus_id])
					puts "========== student no : #{student_no} , Campus Id :#{session[:campus_id]}   "
			        @student.update_attributes( status:"A" , student_no:student_no )
				 end


				# 2- udpate table sd_admission
				admission_no =  "#{admission.acd_course_faculty.abbr}-#{@@common.getNextCode('ADMISSION NO. TC' , session[:campus_id] )}"

		        admission.update_attributes(status:"A" , admission_no:admission_no)

				# 3- insert into studnet log

				studentLog = SdnStatusLog.new()
				studentLog.student_id = @student.id
				studentLog.admission_id = admission.id
				studentLog.status_type = "A"
				studentLog.start_date = DateTime.now
				studentLog.status_by_id = session[:user_id]
				studentLog.campus_id = session[:campus_id]
				studentLog.save

				# 4- update end date on old transaction
				SdnStatusLog.where(student_id:@student.id , status_type:"N").update_all(end_date:DateTime.now)

		        auditrail =AuditialController.new
				auditrail.create( session[:user_id] , 'Ative', 'Student',"Ative Student =   #{@student.first_name} #{@student.last_name}"," #{params}")

				result = admission

			end
		end
		return result
	end
	def active_student_wu_service
		result = false

		if !params[:student_id].nil?
			SdnStudent.transaction do
				time = Time.now

				# result = SdnStudent.find(params[:student_id])
				# # result.status = "A"
				# admission = result.sdn_admission.first

				# ====== new update (2015-09-16) student_id is admission id
				admission = SdnAdmission.find params[:student_id]
				@student = SdnStudent.find admission.student_id

				#=== end


				# 1- update table sdn_student
				if @student.student_no.nil? || @student.student_no.empty?
					student_no =@@common.getNextCode("STUDENT_NO", session[:campus_id])
					@student.update_attributes( status:"A" , student_no:student_no )
        		end

				# 2- udpate table sd_admission
				admission_no = "#{admission.acd_batch.code}-#{admission.acd_degree.abbr}#{@@common.getNextCode('ADMISSION NO. WU' , session[:campus_id] )}"
				admission.update_attributes(status:"A" , admission_no:admission_no)
				# 3- insert into studnet log

				studentLog = SdnStatusLog.new()
				studentLog.student_id = @student.id
				studentLog.admission_id = admission.id
				studentLog.status_type = "A"
				studentLog.start_date = DateTime.now
				studentLog.status_by_id = session[:user_id]
				studentLog.campus_id = session[:campus_id]
				studentLog.save

				# 4- update end date on old transaction
				SdnStatusLog.where(student_id:@student.id , status_type:"N").update_all(end_date:DateTime.now)
				auditrail =AuditialController.new
				auditrail.create( session[:user_id] , 'Ative', 'Student',"Ative Student =   #{@student.first_name} #{@student.last_name}"," #{params}")
				result = admission
			end
		end
		return result
	end

	def cancel_student_service
		result = false
		if !params[:admission_id].nil?
			SdnStudent.transaction do
				admission_id = params[:admission_id]

				admission = SdnAdmission.find admission_id

				result = SdnStudent.find(admission.student_id)
				# result.status = "A"

				# 1- update table sdn_student
				result.update_attributes( status:"C" )
				# 2- udpate table sd_admission
				admission.update_attributes(status:"C")
				# 3- insert into studnet log

				studentLog = SdnStatusLog.new()
				studentLog.student_id = result.id
				studentLog.admission_id = admission.id
				studentLog.status_type = "C"
				studentLog.start_date = DateTime.now
				studentLog.status_by_id = session[:user_id]
				studentLog.campus_id = session[:campus_id]
				studentLog.save
				# 4- update end date on old transaction
				SdnStatusLog.where(student_id:result.id , status_type:"N").update_all(end_date:DateTime.now)
				auditrail =AuditialController.new
				auditrail.create( session[:user_id] , 'Cancel', 'Student',"Cancel Student =   #{result.first_name} #{result.last_name}"," #{params}")

			end
		end
		return result
	end
	def data_permit_student_khr
		params.require(:data).require(:studentKhrModel).permit(
				:id,
				:gender,
				:date_of_birth,
				:place_of_birth,
				:address,
				:phone,
				:total_score,
				:diploma_year,
				:diploma_grade,
				:is_passed_diploma,
				:diploma_num,
				:certificate,
				:institue,
				:institue_city,
				:city,
				:father_name,
				:mother_name,
				:occupation
			)

	end
	def permit_data_fee_charge
		params.require(:data).require(:feeChargeModel).permit(
			:id,
			:key_account_id,
			:plan_id,
			:cycle_type_id,
			:credit_control_id,
			:pay_type,
			:is_vat,
			:vat_number,
			:deposit_receipt_no,
			:deposit_fee,
			:total_fee,
			:fee_paid,
			:credit_balance,
			:cycle_fee,
			:net_cycle_fee,
			:note,
			:is_acitve,
			:end_date,
			:sdn_additional_fee_attributes =>[
				:id,
				:fee_charge_id,
				:item_charge_id,
				:charge_amount,
				:is_recurring,
				:is_bill,
				:note,
				:is_del
			],
			:sdn_fee_discount_attributes =>[
				:id,
				:fee_charge_id,
				:discount_item_detail_id,
				:discount_amount,
				:discount_p,
				:deduct_type,
				:is_bill,
				:discount_by_id,
				:note,
				:is_del
			]
		)
	end

	def permit_data_addmission
		params.require(:data).require(:admissionModel).permit(
			:id,
			:admission_no,
			:admission_date,
			:admission_by_id,
			:admission_type,
			:program_type,
			:tuition_time_id,
			:term_id,
			:s_level_id,
			:c_level_id,
			:batch_id,
			:degree_id,
			:course_id,
			:class_shift_id,
			:major_id,
			:start_acd_year_id,
			:end_acd_year_id,
			:note

		)

	end
	def permit_data_mother_contact
		params.require(:data).require(:motherModel).permit(
			:id,
			:title_id,
			:contact_name,
			:gender,
			:address,
			:email,
			:phone
		)
	end
	def permit_data_father_contact
		params.require( :data ).require(:fatherModel).permit(
			:id,
			:title_id,
			:contact_name,
			:gender,
			:address,
			:email,
			:phone
		)

	end
	def permit_data_emergency_contact
		params.require( :data ).require(:emergencyModel).permit(
			:id,
			:title_id,
			:contact_name,
			:gender,
			:address,
			:email,
			:phone
		)
	end

	def permit_image
		params.permit(:image)

	end
	def permit_data_student
		params.require( :data ).require(:studentModel).permit(
			:id,
			:lead_id,
			:category_id,
			:title_id,
			#:student_code,
			#:student_no,
			:first_name,
			:last_name,
			:khr_first_name,
			:khr_last_name,
			:gender,
			:date_of_birth,
			:registered_date,
			:place_of_birth,
			:phone_no,
			:email,
			:address,
			:occupation_id,
			:national_id,
			:religion_id,
			:langauge_id,
			:ethnicity_id,
			:national_no,
			:passport_no,
			:image_url,
			:note,
			:handler,
			:from_city_id,
			sdn_document_attributes:[
				:id,
				:doc_name,
				:doc_type_id,
				:file_path,
				:is_del
			]

		)
	end

	def permit_data_document
		params.permit(
				:doc_name,
				:doc_type_id,
				:avatar
			)
	end
end
