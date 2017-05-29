class AcdStandardsController < ApplicationController
	@@common = CommonFunction.new

	def index
		data = 	AcdStandard.where( is_deleted: false )	
		render @@common.returnPaginate(  data, params[:page],params[:limit])
	end

	def combo
		data =[] 	
		if !params[:degree_id].nil? 
			data = DegreeStandard.joins(:acd_standard).where(degree_id:params[:degree_id]).select("degree_standards.degree_id , degree_standards.standard_id, acd_standards.id,acd_standards.code , acd_standards.name , acd_standards.sequence")
		else
			data =AcdStandard.where( is_deleted: false )	
		end
		render json:{ data:data , success:true}
	end
	def create
		@data = AcdStandard.new(permit_data)	  
		@data.is_deleted =false

	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'AcdStandard',"create new name =   #{@data.name}","#{params}");
	    	render @@common.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = AcdStandard.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AcdStandard',"udpate name =   #{@data.name}"," #{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	
	end

	def destroy
		@data = AcdStandard.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AcdStandard','delete name =   #{@data.name} ',"#{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors } 
      end	

	end
# ====--------- Additional function
	def getDivisionList
		data =[]
		
		if !params[:degree_standard_id].nil?

			# data = 	AcdStandard.find(params[:id]).acd_standard_division 
			data = AcdStandardDivision.joins(:acd_class_division).select("acd_class_divisions.*").where(stand_degree_id:params[:degree_standard_id])

		end

		render json:{ data:data , success:true }
	end

	def removeDivision
		
		if !params[:id].nil?
			data  = AcdStandardDivision.find(params[:id])
			data.delete
			# data.delete_all
			render json:{ data:data , success:true , message:"Remove Success"}

		else
			render json:{ message:"Can't delete without id ", success:false}
		end

	end
# ========== end function

	private
	def permit_data
		params.require(:data).permit(
						:id,
						:code,
						:name,
						:sequence,
						:is_deleted,
						:khr_name
						# , 
						# :acd_standard_division_attributes=>[
						# 	:id , 
						# 	:division_id
						# ]
					
					)		
	end
end
