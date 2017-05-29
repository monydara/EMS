class SdnClassTcStudentsController < ApplicationController
		 @@common = CommonFunction.new

  def index
    condition = " sdn_class_tc_students`.campus_id = #{session[:campus_id]} "
    if !params[:keyword].nil?
      condition = condition +" and 
        (sdn_leads.first_name like '%#{params[:keyword]}%' 
          or sdn_leads.last_name like '%#{params[:keyword]}%' 
          or sdn_leads.khr_first_name like '%#{params[:keyword]}%'
          or sdn_leads.khr_last_name like '%#{params[:keyword]}%'
          or sdn_leads.phone_no like '%#{params[:keyword]}%'
          or sdn_leads.address like '%#{params[:keyword]}%'
          )
      "
    end

    if !params[:degree_id].nil?
       condition = condition+ " and sdn_leads.degree_id = #{params[:degree_id]} "
    end

    if !params[:course_id].nil?
        condition = condition + " and sdn_leads.course_id = #{params[:course_id]} " 
    end

    if !params[:class_shift_id].nil?
        condition = condition+ " and sdn_leads.class_shift_id = #{params[:class_shift_id]} "
    end

    if !params[:start_date].nil?
        condition = condition + " and sdn_leads.registered_date between '#{params[:start_date]}' and '#{params[:end_date]}'"
    end

    data =  SdnClassTcStudent.where(condition).joins(:acd_class_shift , :acd_course_faculty , :acd_degree).select("
      sdn_leads.* , acd_class_shifts.name class_shift , acd_course_faculties.name course , acd_degrees.name degree  ")
    

    if !params[:status].nil?
        case params[:status]
        when 'R'
          data = data.where(is_canceled:false)
        when 'A'
        
        when 'C'
          data = data.where(is_canceled:true)
          
        end


    end

    render @@common.returnJoinPaginate( SdnClassTcStudent, data, params[:page],params[:limit])

  end

  def combo

    data =[]
    if !params[:type].nil? && !params[:degree_id].nil?
      
      data = AcdDegreeCourse.where(degree_id:params[:degree_id])
      # data = data.acd_course_faculty
    elsif !params[:type].nil?
      data = SdnClassTcStudent.where(is_deleted:false,course_type:params[:type])
    end
    render json:{ data:data , success:true }

  end

  @transaction
  def create

    @data = SdnClassTcStudent.new(permit_data)   
    @data.campus_id = session[:campus_id]
    @data.is_del = false
      if @data.save            
        auditrail =AuditialController.new
        auditrail.create(session[:user_id] , 'Create', 'SdnClassTcStudent',"create new id =   #{@data.student_id}","#{params[:data]}")
        render @@common.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors } 
      end

  end

  @transaction
  def update

      @data = SdnClassTcStudent.find((params[:id]))
      @data.update_attributes(permit_data)      

      if  @data.valid?        
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Update', 'SdnClassTcStudent',"udpate id =   #{@data.student_id}"," #{params[:data]}");
          render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
          render json: { success: false, errors:  @data.errors } 
      end 

  end

  def destroy

    @data = SdnClassTcStudent.find((params[:id]))
    @data.update_attributes(:is_del => true)      

      if  @data.valid?
          auditrail =AuditialController.new;
	      auditrail.create( session[:user_id] , 'Delete', 'SdnClassTcStudent','delete id =   #{@data.student_id} ',"#{params[:data]}");
          render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
      render json: { success: false, errors:  @data.errors } 
      end 

  end


  private
  def permit_data

    params.permit(
			:id,
			:class_id,
			:student_id,
			:enroll_date,
			:enroll_by_id,
			:campus_id,
			:is_del
          )   
  end
end
