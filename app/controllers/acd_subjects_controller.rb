class AcdSubjectsController < ApplicationController::UtilController

  def index
		search = "%%" 
		if !params[:search].nil?
			search ="%#{params[:search]}%"
		end
		data = 	AcdSubject.joins(:acd_subject_type).where( " ( acd_subjects.name like '#{search}' or acd_subjects.code like '#{search}' or acd_subjects.khr_name like '#{search}' or acd_subjects.description like '#{search}')" ).where(is_deleted:false)
		result = data.select(" acd_subjects.* ,acd_subject_types.name subject_type")	
		render $util.returnJoinPaginate(data,  result, params[:page],params[:limit])
	end

	def combo
		data=[]
		if !params[:course_id].nil?
			
			data =AcdCourseSubject.joins(:acd_subject
				).where(
					"is_deleted=#{false} and campus_id=#{session[:campus_id]} and acd_course_id=#{params[:course_id]}"
				).select('acd_subjects.*')
		else
			data = AcdSubject.where(campus_id:session[:campus_id])
		end
		render json:{ data: data , success:true}
	end

	def create
    if !AcdSubject.exists?(code: params[:data][:code],is_deleted:false)
      @data = AcdSubject.new(permit_data)
      @data.is_deleted =false
      @data.campus_id =session[:campus_id]

      if @data.save
        auditrail = AuditialController.new;
        auditrail.create( session[:user_id] , 'Create', 'AcdSubject',"create new subject name =   #{@data.name}","#{params}");
        render $util.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors, message:'Failure to create subject.' }
      end
    else
        render json: { success: false, message: 'Subject code already exists.'}
    end
	end


	def update

    @subject=AcdSubject.find_by code: params[:data][:code], is_deleted:false

    if !@subject.nil?
      if @subject.id!=params[:id].to_i
        render json: { success: false, message: 'Subject code is exists with other record.' }
        return;
      end
    end

    @data = AcdSubject.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'AcdSubject',"update subject name =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors ,message:'Failure to update subject data.'}
    end

	end

	def destroy
		@data = AcdSubject.find((params[:id]))
		@data.update_attributes(:is_deleted => true)	    

      if  @data.valid?
      		auditrail =AuditialController.new;
			    auditrail.create( session[:user_id] , 'Delete', 'AcdSubject','delete subject =   #{@data.name} ',"#{params[:data]}");
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
							:description,
							:khr_name,
							:created_at,
							:updated_at,
							:subject_type_id,
							:sessions, 
							:credit,							
							:is_deleted
					)		
	end
end
