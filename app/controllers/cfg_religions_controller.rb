class CfgReligionsController < ApplicationController::UtilController
	def index
		data = 	CfgReligion.where( is_deleted: false )	
		
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = CfgReligion.new(permit_data)	  
		@data.is_deleted =false	


	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'CfgReligion',"create new ethinicity =   #{@data.name}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = CfgReligion.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'CfgReligion',"udpate ethinicity =   #{@data.name}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = CfgReligion.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'CfgReligion','delete ethinicity =   #{@data.name} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


# additional function 
	def get_all

		data = CfgReligion.where(is_deleted:false) 

		render json:{ data: data , success:true}
	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:name, 
					:khr, 
					:is_deleted
					
					)		
	end
end
