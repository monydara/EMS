class HrDepartmentController < ApplicationController::UtilController

	def index
		data = 	HrDepartment.where( is_deleted: false )	
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = HrDepartment.new(permit_data)	  
		@data.is_deleted =false


	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'HrDepartment',"create new department =   #{@data.department}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = HrDepartment.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'HrDepartment',"udpate department =   #{@data.department}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = HrDepartment.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'HrDepartment','delete department =   #{@data.department} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:department, 
					:is_deleted,
					:description
					)		
	end
end
