class GenOccupationsController < ApplicationController::UtilController
	def index
		data = 	GenOccupation.where( is_deleted: false )	
		
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def combo
		data = 	GenOccupation.where( is_deleted: false )
		render json:{ data:data , success:true}
	end
	def create
		@data = GenOccupation.new(permit_data)	  
		@data.is_deleted =false	


	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'GenOccupation',"create new occupation =   #{@data.name}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = GenOccupation.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'GenOccupation',"udpate occupation =   #{@data.name}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = GenOccupation.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'GenOccupation','delete occupation =   #{@data.name} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:name, 
					:khr, 
					:is_deleted,
					:description
					)		
	end
end
