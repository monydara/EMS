class GenCommunesController < ApplicationController::UtilController
	def index
		data = 	GenCommune	
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = GenCommune.new(permit_data)	  		

	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'GenCommune',"create new name =   #{@data.commune}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = GenCommune.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'GenCommune',"udpate name =   #{@data.commune}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = GenCommune.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'GenCommune','delete name =   #{@data.commune} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


	private
	def permit_data
		params.require(:data).permit(
					:id ,
					:gen_district_id ,
					:gen_city_id ,
					:commune
					)		
	end
end
