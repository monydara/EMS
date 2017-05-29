class AccCreditControlsController < ApplicationController
	@@common =CommonFunction.new

	def index
		begin			
			data = 	AccCreditControl.where( is_del: false, campus_id: session[:campus_id])	
			text = params[:text]
			if !text.nil?
				text = "%"+text+"%"
				
				data =data.where(" policy_name like '#{text}' ")
			end
			render @@common.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def combo
		begin
			data =AccCreditControl.where( is_del: false, campus_id: session[:campus_id])	 
			render json:{ data:data , success:true}
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
		
	end

	def create
		begin
			AccCreditControl.transaction do 

				@data = AccCreditControl.new(permit_data)	  
				@data.is_del =false
				@data.campus_id = session[:campus_id]

			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccCreditControl',"create new cash drawer group  #{@data.policy_name}","#{params}");
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
			AccCreditControl.transaction do 			
				@data = AccCreditControl.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccCreditControl',"udpate cash drawer group  #{@data.policy_name}"," #{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end	
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def destroy
		begin
			AccCreditControl.transaction do 
				@data = AccCreditControl.find((params[:id]))
				@data.update_attributes(:is_del => true)	    

				if  @data.valid?
						auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccCreditControl','delete cash drawer group  #{@data.policy_name} ',"#{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end	
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end	

	end


	private
	def permit_data
		params.require(:data).permit(
				:id,
				:policy_name,
				:due_days,
				:description,
				:is_active,
				:is_del
			)		
	end
end
