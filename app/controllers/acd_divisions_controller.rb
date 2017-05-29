class AcdDivisionsController < ApplicationController
	@@common = CommonFunction.new
	def index
		data = 	AcdClassDivision.where( is_deleted: false )	
		render @@common.returnPaginate(  data, params[:page],params[:limit])
	end

	def combo_degree_division
		data = [] 


		if !params[:standard_id].nil? && !params[:degree_id].nil?
			rel = DegreeStandard.find_by standard_id:params[:standard_id] , degree_id:params[:degree_id]
			if !rel.nil?
				
				data = (rel.acd_standard_division).joins(:acd_class_division).select('acd_class_divisions.*')
			end
		end

		render json:{ data:data , success:true}
	end
	def combo

		if !params[:id].nil?

			data = 	AcdStandard.find(params[:id]).acd_standard_division 
			data = data.joins(:acd_class_division).select("acd_class_divisions.*")
			
		else
			data = AcdClassDivision.where( is_deleted: false )	
		end

		render json:{ data:data , success:true}
	end

	def create
		@data = AcdClassDivision.new(permit_data)	  
		@data.is_deleted =false
	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'AcdClassDivision',"create new division =   #{@data.name}","#{params}");
	    	render @@common.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = AcdClassDivision.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AcdClassDivision',"udpate division =   #{@data.name}"," #{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = AcdClassDivision.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AcdClassDivision','delete division =   #{@data.name} ',"#{params[:data]}");
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
						:sequence,
						:khr_name,
						:is_deleted
					)		
	end
end
