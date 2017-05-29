class AccFeeCatDetailTcController < ApplicationController
	def index
		@data = []
		if !params[:plan_id].nil?
			@data = AccFeePlanDetail.where  plan_id:params[:plan_id].to_i , is_deleted:0
		end
		render json:{ data:@data , success:true }
	end
	def combo
		@data = [] 
		degree_id = params[:degree_id]
		course_id = params[:course_id]
		tuition_time_id = params[:tuition_time_id]
		term_id = params[:term_id]
		campus_id = session[:campus_id]
		if !term_id.nil? && !degree_id.nil? && !course_id.nil? && !tuition_time_id.nil? &&
			!term_id.empty? && !degree_id.empty? && !course_id.empty? && !tuition_time_id.empty?  
			@data = AccFeePlanDetail.joins(:acc_fee_plan).where("
				acc_fee_plans.tuition_time_id = #{tuition_time_id}
				and acc_fee_plans.degree_id = #{degree_id}
				and acc_fee_plans.course_id = #{course_id}
				and acc_fee_plans.campus_id = #{campus_id}
				and acc_fee_plans.is_delleted = 0 
				and acc_fee_plans.is_active = 1 
				and acc_fee_plan_details.is_deleted = 0
				and acc_fee_plan_details.is_active = 1 
				and acc_fee_plan_details.term_id = #{term_id} 
 
				")
		end

		render json:{ success:true, data:@data}

	end

	def create
		begin
			AccFeePlanDetail.transaction do 
				@data = AccFeePlanDetail.new permit_data
				@data.is_deleted =false
				@data.is_active = 1 
				@data.user_id = session[:user_id]
				if @data.valid?
					@data.save  				
					render json:{ success:true}
					
				else
					render json:{success:false , message:@data.errors.full_messages.first}
				end
			end 		
			
		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:e.message , errror:e.backtrace}
		end
	end
	def update
		begin
			AccFeePlanDetail.transaction do 
				@data = AccFeePlanDetail.find params[:id]
				@data.update_attributes permit_data
				if @data.valid?

					@data.save  				
					render json:{ success:true}
				else
					render json:{ success:false , message:@data.errors.full_messages.first}	
				end
			end 		
			
		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:e.message , errror:e.backtrace}
		end		
	end
	def destroy
		begin
			AccFeePlanDetail.transaction do 
				@data = AccFeePlanDetail.find params[:id]
				@data.update_attributes is_deleted:1			
				@data.save  				
				render json:{ success:true}
			end 		
			
		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:e.message , errror:e.backtrace}
		end		
	end
	private
	def permit_data
		params.require(:data).permit(
			
			:plan_id,
			:plan_num,
			:description,
			:cycle_type_id,
			:term_id,
			:currency_id,
			:fee_amount,
			:is_active,
			:is_deleted
		)
	end
end
