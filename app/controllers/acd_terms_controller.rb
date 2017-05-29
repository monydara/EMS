class AcdTermsController < ApplicationController

	@@common = CommonFunction.new

	def index
		data = 	AcdTerm.where( is_deleted: false )	
		render @@common.returnPaginate(  data, params[:page],params[:limit])
	end

	def combo
		data = 	AcdTerm.where( is_deleted: false )	
		render json:{ data:data , success:true}
	end
	def create
		@data = AcdTerm.new(permit_data)	  
		@data.is_deleted =false

	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'AcdTerm',"create new name =   #{@data.term_name}","#{params}");
	    	render @@common.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = AcdTerm.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AcdTerm',"udpate name =   #{@data.term_name}"," #{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = AcdTerm.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AcdTerm','delete name =   #{@data.term_name} ',"#{params[:data]}");
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
			:term_name,
			:is_deleted				
		)		
	end
end
