class AccInvoiceRuleController < ApplicationController
	@@common =CommonFunction.new

	def index
		begin
			data = 	AccInvoiceRule.where( is_del: false)	
			text = params[:text]
			if !params[:ar_policy_id].nil?
				data = data.where(credit_control_id:params[:ar_policy_id])
				if !text.nil?
					text = "%"+text+"%"
					
					data =data.where(" rule_name like '#{text}' ")
				end

			end
			render @@common.returnPaginate(  data, params[:page],params[:limit])
			
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end
	end

	def combo
		begin			
			data =AccInvoiceRule.where( is_del: false, campus_id: session[:campus_id])	 
			render json:{ data:data , success:true}
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end
	end

	def create
		begin
			AccInvoiceRule.transaction do 

				@data = AccInvoiceRule.new(permit_data)	  
				@data.is_del =false

			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccInvoiceRule',"create new cash drawer group  #{@data.rule_name}","#{params}");
			    	render json: { success:true , data:@data , message:"Save Success"}
				else
					render json: { success:false, errors:@data.errors } 
				end
			end
		rescue Exception => e
			puts e.backtrace
			render json:{ success:false , message:"Error Save To table Credit Control ", error:e.message }
		end
		
		
	end

	def update
		begin
			AccInvoiceRule.transaction do 
				@data = AccInvoiceRule.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccInvoiceRule',"udpate cash drawer group  #{@data.rule_name}"," #{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end	
			end 
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end

	end

	def destroy
		begin
			AccInvoiceRule.transaction do
				@data = AccInvoiceRule.find((params[:id]))
				@data.update_attributes(:is_del => true)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccInvoiceRule','delete cash drawer group  #{@data.rule_name} ',"#{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end	
			end
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end


	end


	private
	def permit_data
		params.require(:data).permit(
				:id,
				:rule_name,
				:from_days,
				:to_days,
				:credit_control_id,
				:alert_type_id,
				:action_type_id,
				:charge_per_day,
				:description,
				:is_active,
				:is_del
			)		
	end
end
