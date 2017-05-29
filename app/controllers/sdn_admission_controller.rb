class SdnAdmissionController < ApplicationController
	@@common = CommonFunction.new

	def index
		begin
			# data =index_service()
			

			data = SdnAdmissionHelper.get_student_data params

			total = SdnAdmissionHelper.get_total_record

			render json:{ success:true , data:data , total:total}
		rescue Exception => e
			render json:{ success:false ,message:e.message}
		end

  	end
  	
  	def combo
  		student_id = params[:student_id]
  		if !student_id.nil?
  			@data = SdnAdmission.joins(:acd_degree,:acd_course_faculty).where student_id:student_id , status:"A"
  			@data = @data.select(" sdn_admissions.* , acd_degrees.name degree_name , acd_course_faculties.name course_name")
  			render json:{ data:@data , success:true }
		else 
			render json:{success:false , message:'Cannot get addmission without student_id '}
  		end
  		
  	end

	def get_admission
		begin
			admission_no = params[:admission_no]
			result = SdnAdmission.joins(:sdn_student).where(admission_no:admission_no)
			data = result.select("sdn_admissions.* ,
					concat(sdn_students.first_name, sdn_students.last_name) 'student_name',
					sdn_students.student_no ,
					sdn_students.gender,
					sdn_students.date_of_birth dob, 
					sdn_admissions.id sdn_student
					")
			render json:{ data:data , success:true }

		rescue Exception => e
			render json:{ success:false , message:e.message }
		end
	end

  def get_wu_admission_list
    begin

      str_conditions="acd_degrees.degree_type='WU'"
      puts 'get admission wu'

      if !params[:search].nil?

        str_conditions += " and ( sdn_admissions.admission_no like '%#{params[:search]}%' or
                             sdn_students.student_no like '%#{params[:search]}%' or
                             sdn_students.first_name like '%#{params[:search]}%' or
                             sdn_students.last_name like '%#{params[:search]}%' or
                             acd_degrees.name like '%#{params[:search]}%' )
                            "
        data=SdnAdmission.joins(:sdn_student,:acd_degree,:acd_course_faculty).
                          where(str_conditions).where(status:"A")
        result=data.select("sdn_admissions.id,sdn_admissions.admission_no,sdn_students.student_no,
                            concat(sdn_students.last_name, ' ', sdn_students.first_name) name,
                            acd_degrees.name degree,acd_course_faculties.name course,
                            sdn_admissions.status,
                            sdn_admissions.record_stat
                      ")
      else
        data=SdnAdmission.joins(:sdn_student,:acd_degree,:acd_course_faculty).where(str_conditions).where(status:"A")
        result=data.select("sdn_admissions.id,sdn_admissions.admission_no,sdn_students.student_no,
                            concat(sdn_students.last_name, ' ', sdn_students.first_name) name,
                            acd_degrees.name degree,acd_course_faculties.name course,
                            sdn_admissions.status,
                            sdn_admissions.record_stat,
                            sdn_admissions.student_id
                      ")
      end

      render @@common.returnJoinPaginate( data,result, params[:page],params[:limit])

      #render json:{ data:data , success:true }

    rescue Exception => e
      render json:{ success:false , message:e.message }
    end

  end

	def save_admission_transfer
		begin
			data = SdnAdmission.new(param_admission)
			data.status = 'A'
			data.campus_id = session[:campus_id]
			data.reference_no = data.admission_no
			data.admission_no =nil

			data.save

			render json:{ data:data , success:true }
		rescue Exception => e
			render json:{ success:false , message: e.message }
		end
  end

	def get_student_contact
		begin
			data = get_student_contact_service()
			render json:{ data:data,success:true}
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end

	def get_additional_charge
		data = get_additional_charge_service
		render json:{ data: data , success:true}
	end

	def get_discount
		data = get_discount_service
		render json:{ data:data , success:true}
	end

	def get_students_to_enrollment
		data = get_student_for_enrollment
		render json:{ data:data, success:true}
	end

	def get_khr_value

		fatherContact = SdnContact.find_by student_id:params[:student_id],contact_type:'F'
		motherContact = SdnContact.find_by student_id:params[:student_id],contact_type:'M'
		emergencyContact = SdnContact.find_by student_id:params[:student_id],contact_type:'E'
		if params[:type].nil?
			data  = SdnStudentKhr.find_by student_id:params[:student_id]
			render json:{data:data , fatherContact:fatherContact , motherContact:motherContact , emergencyContact:emergencyContact, success:true}
		else
			render json:{ fatherContact:fatherContact , motherContact:motherContact , emergencyContact:emergencyContact, success:true}

		end
	end

	def promote_student
		begin
			class_id = params[:class_id]
			admission_id = params[:admission_id]
			class_type = params[:class_type]
			@admission = SdnAdmission.find admission_id 
			old_class_id =@admission.class_id  
			puts "============== id : #{old_class_id}"
			SdnStudentPromote.create( admission_id:admission_id , 
				class_type:class_type ,
				from_class_id:@admission.class_id , 
				to_class_id: class_id , 
				promoted_by_id:session[:user_id], 
				campus_id:session[:campus_id], 
				promoted_date:Date.today 

			)
			# check on class type if WU mean from ajax defference form
			if class_type =="WU"
				
				@sdnTcClass = SdnClassStudent.find_by admission_id:admission_id , is_del:false , class_id:old_class_id
			else 

				@sdnTcClass = SdnClassTcStudent.find_by admission_id:admission_id , is_del:false , class_id:old_class_id
			end
			
			@sdnTcClass.class_id = class_id 
			@sdnTcClass.save

			@admission.class_id = class_id 
			@admission.save
			render json:{ data:@admission , success:true }

		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:" Have problem on promote class. Please contact to admin", errors:e.message }
		end
	end
# for additional function
	private

	def get_additional_charge_service
		data = []
		if !params[:student_id].nil?
			data = SdnFeeCharge.find_by student_id:params[:student_id]
			if !data.nil?
				data = data.sdn_additional_fee
			end
		end
		return data
	end

	def get_discount_service
		data = []
		if !params[:student_id].nil?
			data = SdnFeeCharge.find_by student_id:params[:student_id]
			if !data.nil?
				data = data.sdn_fee_discount
			end
		end
		return data
	end

	def get_student_contact_service
		data = []

		if !params[:admission_id].nil?
			admission = SdnAdmission.find params[:admission_id]

			data = admission.sdn_student.sdn_contact

		end
		if !params[:student_id].nil? && !params[:student_id].empty?
			data = SdnStudent.find(params[:student_id]).sdn_contact
		end
		return data
  end

	def index_service
		where =""
		text =params[:text]
		if text.nil?
			text= ""
		end

		if params[:type].to_s == "WU"
			where =" not sdn_admissions.batch_id is null "
			return SdnAdmission.joins(
				:sdn_student ,
				:acd_class_shift,
				:acd_batch,
				:acd_degree ,
				:acd_course_faculty
				).select("
				distinct
				sdn_students.*,

				acd_batches.name batch_name ,
				acd_degrees.name degree_name ,
				acd_course_faculties.name course_name,
				acd_class_shifts.name class_shift_name,

				sdn_admissions.tuition_time_id ,
				sdn_admissions.term_id ,
				sdn_admissions.s_level_id ,
				sdn_admissions.c_level_id ,
				sdn_admissions.batch_id ,
				sdn_admissions.degree_id ,
				sdn_admissions.course_id ,
				sdn_admissions.class_shift_id ,
				sdn_admissions.major_id ,
				sdn_admissions.admission_date,
				sdn_admissions.admission_type ,
				sdn_admissions.start_acd_year_id

			").where(where)
		elsif params[:type].to_s == "TC"

			where =" sdn_admissions.batch_id is null "

			return SdnAdmission.joins(:sdn_student ,
					:acd_class_shift,
					:acd_term,
					:acd_degree ,
					:acd_course_faculty
				 ).joins("

				 	left join acc_student_accounts on acc_student_accounts.student_id =sdn_students.id

				   ").select("
				distinct
				sdn_students.*,

				acd_degrees.name degree_name ,
				acd_course_faculties.name course_name,
				acd_class_shifts.name class_shift_name,
				acd_terms.term_name term_name ,

				sdn_admissions.tuition_time_id ,
				sdn_admissions.term_id ,
				sdn_admissions.s_level_id ,
				sdn_admissions.c_level_id ,
				sdn_admissions.batch_id ,
				sdn_admissions.degree_id ,
				sdn_admissions.course_id ,
				sdn_admissions.class_shift_id ,
				sdn_admissions.major_id ,
				sdn_admissions.admission_date,
				sdn_admissions.admission_type ,
				sdn_admissions.start_acd_year_id,

				acc_student_accounts.account_no,
				acc_student_accounts.status account_status,
				acc_student_accounts.balance

			").where(where)

		else

			return SdnAdmission.joins(

				"left join  sdn_students on sdn_students.id = sdn_admissions.student_id
				left join acd_class_shifts on acd_class_shifts.id = sdn_admissions.class_shift_id
				left join acd_batches on acd_batches.id = sdn_admissions.batch_id
				left join acd_course_faculties on acd_course_faculties.id = sdn_admissions.course_id
				left join acd_degrees on acd_degrees.id = sdn_admissions.degree_id
				"

				 ).select("
				sdn_students.*,

				acd_batches.name batch_name ,
				acd_degrees.name degree_name ,
				acd_course_faculties.name course_name,
				acd_class_shifts.name class_shift_name,


				sdn_admissions.tuition_time_id ,
				sdn_admissions.term_id ,
				sdn_admissions.s_level_id ,
				sdn_admissions.c_level_id ,
				sdn_admissions.batch_id ,
				sdn_admissions.degree_id ,
				sdn_admissions.course_id ,
				sdn_admissions.class_shift_id ,
				sdn_admissions.major_id ,
				sdn_admissions.admission_date,
				sdn_admissions.admission_type ,
				sdn_admissions.start_acd_year_id

			").where("
				sdn_students.status = 'A'
			")
		end
	end

	def get_student_for_enrollment
		condition = " sdn_students.campus_id = #{session[:campus_id]} AND sdn_students.status='A' "
	    if !params[:keyword].nil?
	      condition = condition +" and
	        (sdn_students.student_code like '%#{params[:keyword]}%'
	          or sdn_students.student_no like '%#{params[:keyword]}%'
	          or sdn_students.first_name like '%#{params[:keyword]}%'
	          or sdn_students.last_name like '%#{params[:keyword]}%'
	          or sdn_students.khr_first_name like '%#{params[:keyword]}%'
	          or sdn_students.khr_last_name like '%#{params[:keyword]}%'
	          or sdn_students.phone_no like '%#{params[:keyword]}%'
	          or sdn_students.email like '%#{params[:keyword]}%'
	          or sdn_students.address like '%#{params[:keyword]}%'
	          or sdn_students.national_no like '%#{params[:keyword]}%'
	          or sdn_students.passport_no like '%#{params[:keyword]}%'
	          or sdn_students.note like '%#{params[:keyword]}%'
	          )
	      "
	    end

	    if !params[:degree_id].nil?
	       condition = condition+ " and sdn_admissions.degree_id = #{params[:degree_id]} "
	    end

	    if !params[:course_id].nil?
	        condition = condition + " and sdn_admissions.course_id = #{params[:course_id]} "
	    end

	    if !params[:class_shift_id].nil?
	        condition = condition+ " and sdn_admissions.class_shift_id = #{params[:class_shift_id]} "
	    end

	    if !params[:term_id].nil?
	        condition = condition + " and sdn_admissions.term_id = #{params[:term_id]}"
	    end

	    if !params[:tuition_time_id].nil?
	        condition = condition + " and sdn_admissions.tuition_time_id = #{params[:tuition_time_id]}"
	    end

	    if !params[:c_level_id].nil?
	        condition = condition + " and sdn_admissions.c_level_id = #{params[:c_level_id]}"
	    end

	    data =  SdnAdmission.where(condition).joins(:sdn_student, :acd_class_shift).select("
	      sdn_students.* , acd_class_shifts.name class_shift")
	end

	def param_admission
		params.permit(
			:student_id,
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
			:note,
			# :status,
			# :campus_id,
			# :created_at,
			# :updated_at,
			:reference_no
			)
	end
end
