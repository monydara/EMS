class HrPositionsController < ApplicationController::UtilController

	def index
		data = 	HrPosition.where( is_deleted: false )	
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = HrPosition.new(permit_data)	  
		@data.is_deleted =false


	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'HrPosition',"create new position =   #{@data.position}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = HrPosition.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'HrPosition',"udpate position =   #{@data.position}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = HrPosition.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'HrPosition','delete position =   #{@data.position} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:position, 
					:is_deleted,
					:description
					)		
	end
end
