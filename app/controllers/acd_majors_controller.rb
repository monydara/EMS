class AcdMajorsController < ApplicationController

	@@common = CommonFunction.new

  def index
		data = 	AcdMajor.where(is_deleted:false, campus_id:session[:campus_id])
    if !params[:string].nil?
        condition = "name like '%#{params[:string]}%' or code like '%#{params[:string]}%' or khr_name like '%#{params[:string]}%' "
        data = data.where condition
    end

		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def combo
		data = AcdMajor.where(is_deleted:false, campus_id:session[:campus_id])

		if !params[:course_id].nil?
			data = AcdCourseMajor.where(course_id:params[:course_id] ).joins(:acd_major).select("acd_majors.*");
		end
		render json:{ data:data , success:true}
	end

	def create

    if !AcdMajor.exists?(code: params[:data][:code],is_deleted:false)
      @data = AcdMajor.new(permit_data)
      @data.is_deleted =false
      @data.campus_id =session[:campus_id]

      if @data.save
        auditrail = AuditialController.new;
        auditrail.create( session[:user_id] , 'Create', 'AcdMajor',"create new major name =   #{@data.name}","#{params}");
        render $util.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors, message:'Failure to create major.' }
      end
    else
        render json: { success: false, message: 'Key major code already exists.'}
    end

	end


	def update

    @major=AcdMajor.find_by code: params[:data][:code], is_deleted:false

    if !@major.nil?
      if @major.id!=params[:id].to_i
        render json: { success: false, message: 'Major code is exists with other record.' }
        return;
      end
    end

    @data = AcdMajor.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'AcdMajor',"update major name =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors ,message:'Failure to update major data.'}
    end
	end

	def destroy
		@data = AcdMajor.find((params[:id]))
		@data.update_attributes(:is_deleted => true)
      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AcdMajor','delete name =   #{@data.name} ',"#{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors, message:'Failure to delete major from database.' }
      end
	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:code,
					:name,
					:is_deleted,
					:khr_name
					)
	end
end
