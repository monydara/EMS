class AccTranTypesController < ApplicationController::UtilController
	def index
		begin
			data = 	AccTranType.All
			render $util.returnPaginate(  data, params[:page],params[:limit])
					
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end		
	end

	def create
		begin	
			AccTranType.transaction do 
				@data = AccTranType.new(permit_data)	  		

			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccTranType',"create new AccTranType =   #{@data.tran_type_desc}","#{params}");
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
			AccTranType.transaction do 
				@data = AccTranType.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccTranType',"udpate AccTranType =   #{@data.tran_type_desc}"," #{params}");
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
			@data = AccTranType.find((params[:id]))
			@data.destroy()

			if  @data.valid?
					auditrail =AuditialController.new;
				auditrail.create( session[:user_id] , 'Delete', 'AccTranType','delete AccTranType =   #{@data.tran_type_desc} ',"#{params}");
				render :json => { :data =>  @data , :success => 'true' , :total => 1}
			else
				render json: { success: false, errors:  @data.errors } 
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
					:tran_type_desc,
					:is_negative,														
					)		
	end
end
