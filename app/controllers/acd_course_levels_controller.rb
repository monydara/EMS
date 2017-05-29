class AcdCourseLevelsController < ApplicationController
	def index
		data =[]
		if !params[:course_id].nil?
			data = AcdCourseLevel.joins(:acd_course_level_type).where(course_id:params[:course_id]).select("acd_course_levels.* , acd_course_level_types.name as 'level_type'")
		end

		render json: { data:data , success: true}
	end

	def create
		@data = AcdCourseLevel.new(permit_data)	  
	    if @data.save	    
	    	auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Create', 'AcdCourseLevel',"create new name =   #{@data.name}","#{params}");
	    	render $util.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors } 
		end
		
	end


	def update
		@data = AcdCourseLevel.find((params[:id]))
		@data.update_attributes(permit_data)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AcdCourseLevel',"udpate name =   #{@data.name}"," #{params}");
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
								:course_id,
								:level_type_id
					)		
	end

end
