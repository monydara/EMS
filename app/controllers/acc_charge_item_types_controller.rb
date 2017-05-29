class AccChargeItemTypesController < ApplicationController::UtilController
	
	def index
		begin
			data = 	AccChargeItemType.where( is_del: false )
			render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end
	def create
		begin
			AccChargeItemType.transaction do 
				@data = AccChargeItemType.new(permit_data)	  
				@data.is_del =false	


			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccChargeItemType',"create new ChargeItemType =   #{@data.item_type_name}","#{params}");
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
		@data = AccChargeItemType.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AccChargeItemType',"udpate ChargeItemType =   #{@data.item_type_name}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = AccChargeItemType.find((params[:id]))
		@data.update_attributes(:is_del => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AccChargeItemType','delete ChargeItemType =   #{@data.item_type_name} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


# additional function 
	def get_all

		data = AccChargeItemType.where(is_del:false) 

		render json:{ data: data , success:true}
	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
			        :item_type_code,
			        :item_type_name,
			        :note,			        
			        :is_del
					)		
	end
end
