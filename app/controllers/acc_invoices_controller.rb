class AccInvoicesController < ApplicationController
	def index
		@data = [] 
		account_id = params[:account_id]
		billing_process_id = params[:billing_process_id]
		admission_no = params[:admission_no]
		if !account_id.nil?
			@data =  AccInvoice.where account_id:account_id
		elsif !billing_process_id.nil?
			@data =  AccInvoice.where billing_process_id:billing_process_id
		elsif !admission_no.nil? 
			@data =  AccInvoice.joins(:acc_account_master=>[:sdn_admission]).where "sdn_admissions.admission_no = '#{admission_no}' and acc_invoices.is_paid = false"
		end
		render json:{ data:@data , success:true}
	end
	def create

		begin
			AccInvoice.transaction do 
				@service = Acc::GenerateInvoice.new
				data = AccInvoice.new permit_data
				if data.billing_process_id.nil?
					
					@data = @service.new_invoice_obj data,session[:campus_id] , session[:user_id],true ,params[:data]["due_day"]
					if @data.valid?
						@data.save 

						render json:{ success:true , data:@data}
					else
						render json:{ success:false ,message:@data.errors.full_messages.first}
					end
				else #generate invoice with bactch
					@data = @service.new_invoice_batch data,params[:data]["group_account_id"],session[:campus_id] , session[:user_id],true ,params[:data]["due_day"]
					@data.each(&:save)
					@batch_process = AccBatchProcess.find data.billing_process_id
					@batch_process.update_attributes(status:"S")
					render json:{ success:true , data:@data}
				end
			end 
		rescue Exception => e
			render json:{ success:false , message:e.message}
			
		end
	end

	def process_invoice_simulator		
		@service = Acc::GenerateInvoice.new
		data = AccInvoice.new permit_data_simulator
		@data = @service.new_invoice_batch data,params["group_account_id"],session[:campus_id] , session[:user_id],false, params["due_day"]
		render json:{ success:true , data:@data ,total_invoice:@data.count}
	end
	layout false
	def print_invoice 
		invoice_id = params[:id]
		if invoice_id.nil?
			render json:{ success:false , message:"cannot print without invoice id "}
		else				
			@invoice = AccInvoice.find invoice_id
			@student = @invoice.acc_account_master.sdn_student 
			  
		end
	end
	def print_batch_invoice 
		batch_process_id = params[:id]
		if batch_process_id.nil?
			render json:{ success:false , message:"cannot print without batch process id "}
		else				
			@invoice_list = AccInvoice.where billing_process_id:batch_process_id

			  
		end
	end
	
	private
	def permit_data
		params.require(:data).permit(
			:account_id , 
			:due_date , 
			:from_date,
			:to_date , 
			:invoice_type, 
			:billing_process_id
		)
	end
	def permit_data_simulator
		params.permit(
			:account_id , 
			:due_date , 
			:from_date,
			:to_date , 
			:invoice_type, 
			:billing_process_id
		)
	end
end
