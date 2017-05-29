class AccPaymentMethodsController < ApplicationController::UtilController
	def index		
		begin
			data = 	AccPaymentMethod.where(:is_del => false)
			render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}			
		end
	end

	def create
		begin
			AccPaymentMethod.transaction do 
				@data = AccPaymentMethod.new(permit_data)	  	
				@data.is_del =false

			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccPaymentMethod',"create new AccPaymentMethod =   #{@data.name}","#{params}");
			    	render $util.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end			
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}	
		end
		
	end


	def update
		begin
			AccPaymentMethod.transaction do 
				@data = AccPaymentMethod.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccPaymentMethod',"udpate AccPaymentMethod =   #{@data.name}"," #{params}");
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
			AccPaymentMethod.transaction do 
				@data = AccPaymentMethod.find((params[:id]))
				@data.update_attributes(:is_del => true)

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccPaymentMethod','delete AccPaymentMethod =   #{@data.name} ',"#{params}");
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
					:code,
					:name,
					:method_type,										
					:is_del					
					)		
	end
end
