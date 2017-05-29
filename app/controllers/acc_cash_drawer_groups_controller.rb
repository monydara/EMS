class AccCashDrawerGroupsController < ApplicationController
	@@common =CommonFunction.new

	def index
		begin			
			data = 	AccCashDrawerGroup.where( is_deleted: false, campus_id: session[:campus_id])	
			render @@common.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace        
	        render json: { success: false, message:e.message}
		end
	end

	def create
		begin
			AccCashDrawerGroup.transaction do
				@data = AccCashDrawerGroup.new(permit_data)	  
				@data.created_by = session[:user_id]
				@data.is_deleted =false
				@data.campus_id = session[:campus_id]

			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccCashDrawerGroup',"create new cash drawer group  #{@data.group_name}","#{params}");
			    	render @@common.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end			
		rescue Exception => e
			puts e.backtrace        
	        render json: { success: false, message:e.message}
		end
		
		
	end


	def update
		begin
			AccCashDrawerGroup.transaction do
				@data = AccCashDrawerGroup.find((params[:id]))
				@data.update_attributes(permit_data)	    

		      	if  @data.valid?
		      		auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccCashDrawerGroup',"udpate cash drawer group  #{@data.group_name}"," #{params}");
		        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
		      	else
					render json: { success: false, errors:  @data.errors } 
		      	end
		    end
		rescue Exception => e
			puts e.backtrace        
	        render json: { success: false, message:e.message}
		end			
	end

	def destroy
		begin
			AccCashDrawerGroup.transaction do
				@data = AccCashDrawerGroup.find((params[:id]))
				@data.update_attributes(:is_deleted => true)	    

			    if  @data.valid?
			      		auditrail =AuditialController.new;
						auditrail.create( session[:user_id] , 'Delete', 'AccCashDrawerGroup','delete cash drawer group  #{@data.group_name} ',"#{params}");
			        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
			    else
					render json: { success: false, errors:  @data.errors } 
			    end	
			end
		rescue Exception => e
			puts e.backtrace        
	        render json: { success: false, message:e.message}
		end
		

	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:group_name,
					:description,
					:is_active,
					:is_deleted,
					:campus_id,
					:created_by
					)		
	end
end
