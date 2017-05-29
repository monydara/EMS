class GenNationalitiesController < ApplicationController::UtilController
	def index
		data = 	GenNationality.where( is_deleted: false )	
		
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = GenNationality.new(permit_data)	  
		@data.is_deleted =false	


	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'GenNationality',"create new nationality =   #{@data.name}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = GenNationality.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'GenNationality',"udpate nationality =   #{@data.name}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = GenNationality.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'GenNationality','delete nationality =   #{@data.name} ',"#{params}");
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
