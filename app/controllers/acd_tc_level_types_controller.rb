class AcdTcLevelTypesController < ApplicationController::UtilController
	def index
		
		data = 	AcdCourseLevelType.where( is_deleted: false )	
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = AcdCourseLevelType.new(permit_data)	  
		@data.is_deleted =false
	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'AcdCourseLevelType',"create new level type =   #{@data.name}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = AcdCourseLevelType.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AcdCourseLevelType',"udpate level type =   #{@data.name}"," #{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = AcdCourseLevelType.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AcdCourseLevelType','delete level type =   #{@data.name} ',"#{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:code, 
					:name, 
					:is_deleted
					)		
	end
end
