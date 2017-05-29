class GenCountryController < ApplicationController::UtilController
	def index
		data = 	GenCountry	
		render $util.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		@data = GenCountry.new(permit_data)	  		

	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'GenCountry',"create new name =   #{@data.country}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = GenCountry.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'GenCountry',"udpate name =   #{@data.country}"," #{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = GenCountry.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'GenCountry','delete name =   #{@data.country} ',"#{params}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end


	private
	def permit_data
		params.require(:data).permit(
					:id , 
					:coutry
					)		
	end
end
