class AcdCourseController < ApplicationController
  @@common = CommonFunction.new

  def index
    begin
        data =  AcdCourseFaculty.where( is_deleted: false )
        if !params[:search].nil?
            search = "%#{params[:search]}%"
            data = AcdCourseFaculty.where( "is_deleted = false  and ( name like '#{search}' or code like '#{search}' or abbr like '#{search}' or khr_name like '#{search}'  )  " )
        end
        if !params[:course_type].nil?
            data = data.where(course_type:params[:course_type])
        end
        render @@common.returnPaginate(  data, params[:page],params[:limit])
        
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message}  
    end

  end

  def combo
    begin
        

        data =[]
        if !params[:type].nil? && params[:type] == "TC"

          # for TC degree
          if !params[:degree_id].nil?
            data = AcdDegreeCourse.joins(:acd_course_faculty).where(degree_id:params[:degree_id]).select("acd_course_faculties.*")
          elsif
            data = AcdDegreeCourse.joins(:acd_course_faculty).where("acd_course_faculties.course_type='TC'").select("acd_course_faculties.*")
          end

          
        elsif !params[:type].nil? && params[:type] == "WU" && !params[:degree_id].nil?
         
          data = AcdDegreeCourse.joins(:acd_course_faculty).where(degree_id:params[:degree_id]).select("acd_course_faculties.*")

        else
          data = AcdCourseFaculty.where(is_deleted:false)

        end
        render json:{ data:data , success:true }
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message}  
    end

  end

  def tc_course
    begin        
        data = AcdCourseFaculty.where(is_deleted:false,course_type:'TC')
        render json:{ data:data , success:true }
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message}  
    end
  end

  
  def create
    begin
        AcdCourseFaculty.transaction do 
            @data = AcdCourseFaculty.new(permit_data)

            @data.is_deleted =false
            @data.campus_id = session[:campus_id]

            if @data.save
                auditrail =AuditialController.new
                auditrail.create(session[:user_id] , 'Create', 'AcdCourseFaculty',"create new name =   #{@data.name}","#{params[:data]}")
                render @@common.returnSave(@data)
            else
                render json: { success: false, errors:  @data.errors }
            end
        end 
        
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message} 
    end

  end

  
  def update
    begin
        AcdCourseFaculty.transaction do 
            @data = AcdCourseFaculty.find((params[:id]))
            @data.update_attributes(permit_data)

            if  @data.valid?
                auditrail =AuditialController.new;
                auditrail.create( session[:user_id] , 'Update', 'AcdCourseFaculty',"udpate name =   #{@data.name}"," #{params[:data]}");
                render :json => { :data =>  @data , :success => 'true' , :total => 1}
            else
                render json: { success: false, errors:  @data.errors }
            end

        end
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message} 
    end

  end

  def destroy
    begin
        AcdCourseFaculty.transaction do 
            @data = AcdCourseFaculty.find((params[:id]))
            @data.update_attributes(:is_deleted => true)

            if  @data.valid?
                auditrail =AuditialController.new;
                auditrail.create( session[:user_id] , 'Delete', 'AcdCourseFaculty','delete name =   #{@data.name} ',"#{params[:data]}");
                render :json => { :data =>  @data , :success => 'true' , :total => 1}
            else
                render json: { success: false, errors:  @data.errors }
            end

        end     
        
    rescue Exception => e
        puts e.backtrace 
        render json:{ success:false , message:e.message} 
    end

  end


  private
  def permit_data

    params.require(:data).permit(
                :id,
                :code,
                :abbr,
                :name,
                :khr_name ,
                :course_type,
                :credit,
                :status ,
                :description,
                :is_deleted,
                :acd_course_major_attributes => [ :id , :major_id , :is_default , :_destroy]
          )
  end

end
