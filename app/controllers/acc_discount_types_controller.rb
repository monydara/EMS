class AccDiscountTypesController < ApplicationController::UtilController
	def index
		begin
			data = 	AccDiscountType.where( is_del: false )	
			render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }			
		end
	end

	def create
		begin
			AccDiscountType.transaction do 
				@data = AccDiscountType.new(permit_data)	  
				@data.is_deleted =false


			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccDiscountType',"create new DiscountTyp =   #{@data.name}","#{params}");
			    	render $util.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end 
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }	
		end
		
	end


	def update
		begin
			AccDiscountType.transaction do 
				@data = AccDiscountType.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccDiscountType',"udpate DiscountType =   #{@data.name}"," #{params}");
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
			AccDiscountType.transaction	 do 
				@data = AccDiscountType.find((params[:id]))
				@data.update_attributes(:is_deleted => true)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccDiscountType','delete DiscountType =   #{@data.name} ',"#{params}");
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
					:code, 
					:name,
					:is_del				
					)		
	end
end
