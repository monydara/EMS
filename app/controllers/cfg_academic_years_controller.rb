class CfgAcademicYearsController < ApplicationController::UtilController
  def index
		data = 	CfgAcademicYear.where( gen_campus_id: session[:campus_id],is_deleted: false )
		render $util.returnPaginate(data, params[:page],params[:limit])
  end

	def combo
		data = 	CfgAcademicYear.where( gen_campus_id: session[:campus_id] )	
		render json:{ data:data , success:true }
  end

	def create
      if !CfgAcademicYear.exists?(code: params[:data][:code],is_deleted:false)
          @data = CfgAcademicYear.new(permit_data)
          @data.gen_campus_id=session[:campus_id]
          @data.is_deleted =false
          @data.user_id=session[:user_id]

          if @data.save
             auditrail =AuditialController.new;
             auditrail.create(session[:user_id] , 'Create', 'CfgAcademicYear',"create new academic year=#{@data.name}","#{params}")
             render $util.returnSave(@data)
          else
             render json: { success: false, errors:  @data.errors, message:'Failure to create academic year.' }
          end
      else
          render json: { success: false, message: 'Academic year code already exists.'}
      end
  end


	def update
    @academic_year=CfgAcademicYear.find_by code: params[:data][:code], is_deleted:false
    if !@academic_year.nil?
      puts @academic_year.id
      puts params[:id]
      if @academic_year.id!=params[:id].to_i
        render json: { success: false, message: 'Academic year code is exists with other record.' }
        return;
      end
    end

    @data = CfgAcademicYear.find((params[:id]))
    @data.update_attributes(permit_data)
    if  @data.valid?
        auditrail = AuditialController.new;
        auditrail.create( session[:user_id] , 'Update', 'CfgAcademicYear',"Update academic year =#{@data.name}"," #{params}");
        render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
        render json: { success: false, errors:  @data.errors }
    end
  end

  def destroy
    @data = CfgAcademicYear.find((params[:id]))
    @data.update_attributes(:is_deleted => true)
    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Delete', 'CfgAcademicYear','delete name =#{@data.name} ',"#{params}")
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
					:start_date,
					:end_date
					)		
	end

end