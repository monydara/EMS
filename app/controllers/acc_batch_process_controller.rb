class AccBatchProcessController < ApplicationController
	def index
		@data = AccBatchProcess.joins(:acc_group_account).select("acc_batch_processes.* , acc_group_accounts.group_name")
		render json:{ data:@data , success:true}
	end
	def create
		begin
			@data = AccBatchProcess.new permit_data
			@data.campus_id = session[:campus_id]
			# @data.proc_date = Date.today
			@data.status ="N"
			if @data.valid?
				@data.save
				render json:{ data:@data , success:true}
			else 
				render json:{ success:false , message:@data.errors.full_messages.first}
			end
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end
	def update
		begin
			@data = AccBatchProcess.find params[:id]
			@data.update_attributes(permit_data)
			if @data.valid?
				@data.save
				render json:{ data:@data , success:true}
			else 
				render json:{ success:false , message:@data.errors.full_messages.first}
			end
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end
	def destroy
		
	end
	private
	def permit_data
		params.require(:data).permit(			
			:group_account_id,
			:batch_proc_code,
			:batch_proc_name,
			:proc_date,
			:total_invoices,
			:status,			
		)
	end
end
