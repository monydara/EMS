class AccAccountMastersController < ApplicationController
	@@common =CommonFunction.new
	def index
		@data = []
		if !params[:student_id].nil?
			@data = AccAccountMaster.joins(  sdn_admission:[:acd_course_faculty]
				).joins("left join acc_cycle_types on acc_cycle_types.id = acc_account_masters.cycle_type_id").where student_id:params[:student_id]
			@data =@data.select("acc_account_masters.* , sdn_admissions.admission_no , acc_cycle_types.cycle_name , acd_course_faculties.name course_name")
		
			
		end
		render json:{ data:@data , success:true }
		
	end
	def get_account_list
		service = Acc::AccountMaster.new
		@data = service.get_data params
		render @@common.returnJoinPaginate( @data["model"], @data["result"], params[:page],params[:limit])
	end
	def get_admission_by_group_account
  		@data = [] 
  		group_account_id =params[:group_account_id]
  		if !group_account_id.nil? 
  			data = AccAccountMaster.joins(sdn_admission:[:acd_degree, :acd_course_faculty,:sdn_student]).where group_account_id:group_account_id,status:"A",is_deleted:false
  			@data = data.select("acc_account_masters.* , acd_degrees.name degree_name , acd_course_faculties.name course_name , sdn_students.first_name , sdn_students.last_name, sdn_admissions.admission_no")
  		end

  		render json:{ data:@data ,success:true }
  	end
	def get_account_detail
		account_id = params[:account_id]
		if !account_id.nil? && account_id.to_i > 0 
			# @data =AccAccountDetail.where account_id:account_id 
			@data = AccAccountDetail.find_by_sql "
				select * from vw_account_detail where account_id = #{account_id}
			"
			render json:{ data:@data , success:true}
		else 
			render json:{data:[] , success:true }
			
		end
	end
	def get_simulate_data_invoice
		begin
			
			account_id = params[:account_id]
			@service = Acc::GenerateInvoice.new 
			@commonClass= CommonFunction.new

			item_data = @service.get_data_invoice account_id
			inv_no = @commonClass.getNextCodeOnly("INVOICE NO",session[:campus_id])
			invoice_type = @service.get_invoice_type account_id

			render json:{ data:item_data, invoice_no:inv_no,invoice_type:invoice_type,account_id:account_id ,success:true}
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end
	def create
		begin
			AccAccountMaster.transaction do 
				@data = AccAccountMaster.new permit_data
				@data.status = "A"
				@data.is_deleted = false 
				if @data.valid?
					@data.save 
					render json:{ success:true , data:@data}
				else 
					render json:{ success:false , message:@data.errors.full_messages.first}
				end
			end 

		rescue Exception => e
			render json:{ success:false , message:e.message}		
		end


	end
	def update
		begin
			AccAccountMaster.transaction do 
				@data = AccAccountMaster.find params[:id]
				@data.update_attributes( permit_data)				
				if @data.valid?
					@data.save 
					render json:{ success:true , data:@data}
				else 
					render json:{ success:false , message:@data.errors.full_messages.first}
				end
			end 

		rescue Exception => e
			render json:{ success:false , message:e.message}		
		end


	end

	def permit_data
		params.require(:data).permit(			
			:student_id,
			:admission_id,
			:key_account_id,
			:credit_control_id,
			:fee_plan_detail_id,
			:fee_type,
			:vat_no,
			:cycle_type_id,
			:account_type,
			:fee_per_cycle,
			:balance,
			:status,
			:group_account_id,
			:user_id,
			:is_deleted,
			acc_account_detail_attributes:[
				:id,
				:account_id,
				:item_id,
				:item_type,
				:item_unit,
				:item_value,
				:is_recurring,
				:recurring_val,
				:effective_date,
				:expired_date,
				:comments,
				:is_deleted
			]

			)
	end
end

