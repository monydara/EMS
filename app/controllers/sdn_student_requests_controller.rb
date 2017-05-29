class SdnStudentRequestsController < ApplicationController
      @@common = CommonFunction.new

  # def check_exist(data)
  #     student_id = data["student_id"]
  #     check_message = {'exist' => false}
  #     studentId = SdnStudentRequest.where("lower(student_id)=? AND campus_id=?",data["student_no"].downcase,false)
  #     puts"****************** Student Id : #{studentId}"

  #     if !student_id.nil? then  # check exist for edit when user input the same name/code or doesn't change anything
  #           studentId = studentId.where.not(student_id:student_id)
  #           if studentId.count > 0 then
  #               check_message = {'exist' => true,'msg' => 'Student is already exist'}      
  #           end
  #     end
      
  #     if studentId.count >0 then
  #         check_message = {'exist' => true, 'msg'=> 'Student id is already exist'}  
  #     end
  #     puts "************ Student id message : #{check_message}"
  #     return check_message     
  # end

  def index
      # condition = 'sys_users.id!=1'
      condition = 'sdn_student_requests.id!=-1 '
      # select marker.user_id as 'marker', checker.user_id as 'checker'  from sdn_student_requests s 
      # left join sys_users marker on marker.id = s.marker_id 
      # left join sys_users checker on checker.id = s.checker_id


      data  = SdnStudentRequest.joins(:sdn_student,"LEFT JOIN sys_users marker on marker.id=sdn_student_requests.marker_id LEFT JOIN sys_users checker on checker.id = sdn_student_requests.checker_id" )
      result = data.select("sdn_student_requests.*,
                            sdn_students.first_name,
                            sdn_students.last_name ,
                            sdn_students.student_no AS student_no,
                            marker.user_id AS 'marker',
                            checker.user_id AS'checker'")
      # Name = ''
      requestNo = params[:request_no]
      firstName = params[:first_name]
      lastName = params[:last_name]
      studentNo = params[:student_no]

      puts "***************** First Name : #{firstName}"

      if !params[:text].nil? && !params[:text].empty?  
          text = '%'+params[:text]+'%' 

          puts "******* this is text passing from textfield searech : #{text}"

          condition += "AND ( sdn_student_requests.request_no like '#{text}' " +
           " or sdn_students.first_name like '#{text}' " + 
           " or sdn_students.note like '#{text}' " + 
           " or sdn_students.status like '#{text}' " + 
            " or sdn_students.last_name like '#{text}' " + 
           " or sdn_students.id like '#{text}' " +
            " or sdn_students.status like '#{text}' " +
           " or sdn_students.student_no like '#{text}') " 
      end 

      if !requestNo.nil? && !requestNo.empty?
        text = '%'+params[:request_no]+'%' 
        condition += "AND sdn_student_requests.request_no LIKE '#{text}' "
      end
      if !firstName.nil? && !firstName.empty?
        text = '%'+params[:first_name]+'%' 
        condition += " AND sdn_students.first_name LIKE '#{text}' "
      end
      if !lastName.nil? && !lastName.empty?
        text = '%'+params[:last_name]+'%' 
        condition += " AND sdn_students.last_name LIKE '#{text}' "
      end
      if !studentNo.nil? && !studentNo.empty?
        text = '%'+params[:student_no]+'%' 
        condition += " AND sdn_students.student_no LIKE '#{text}' "
      end

      result = result.where(condition)
      data = result.paginate(:page => params[:page], :per_page => params[:limit] )   
      total = result.length

      puts "+++++++++++++++++++++++++++++++++ Total number of record : #{total}"
      # name = data.first_name+data.last_name
      # puts("************ #{name}")
      render json:{data:result ,success:true, total:total}
    
  end

  def create
    new_request_no = ''
    last_request_no = SdnStudentRequest.last
    
    if !last_request_no.nil? then 
      last_request_no = last_request_no.request_no
      new_request_no = (last_request_no.to_i + 1).to_s
      length = new_request_no.length

      if(length == 1) then
        new_request_no = "00000" + new_request_no
      elsif (length ==2) then
        new_request_no = "0000" + new_request_no
      elsif (length == 3) then
        new_request_no = "000" + new_request_no
      elsif (length == 4) then
        new_request_no = "00" + new_request_no
      elsif(length == 5) then
        new_request_no = "0" + new_request_no
      end
    else
      new_request_no = "000001" 
    end

    data = SdnStudentRequest.new(permit_data)
    data.campus_id = session[:campus_id]
    data.marker_id = session[:user_id]
    data.checker_id = session[:user_id]
    data.checker_id = ''

    data.request_no = new_request_no

    puts"Create function : request_no = #{data.request_no},********Checker = #{data.checker_id}"

    # data.request_no = @@common.getNextCode("STUDENT REQUEST",session[:campus_id] )
    data.maker_date = DateTime.now   
    data.status ='N'

    if data.save     
      auditrail = AuditialController.new
     # create(user_id ,type, modules, description, data_detail)
      auditrail.create(session[:user_id] , 'Create', 'SdnStudentRequest',"create new marker id = #{data.marker_id}","#{params[:data]}")

      render json:{data:data, success:true}
      # render @@common.returnSave(data)
    else
      render json: { success: false, errors: data.errors } 
    end
  end

  # @transaction
  def update    
      data = SdnStudentRequest.find(params[:id])
      data.update_attributes(permit_data)
      if  data.valid?
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] ,
           'Update', 'SdnStudentRequest',
           "udpate student id =   #{data.student_id}"," #{params[:data]}");
          render :json => { :data =>  data , :success => 'true' , :total => 1}
      else
          render json: { success: false, errors:  data.errors} 
      end
  end

  def approveRequest
    data = []
    if !params[:request_id].nil?
      data  = SdnStudentRequest.find(params[:request_id])
      data.checker_id = session[:user_id]
      data.checker_date = DateTime.now
      data.update_attributes(status:"A")
      # puts "Approve : ********* this is Check_id : #{data.checker_id},******* Checker Data : #{data.checker_date}"
    end   
    render json:{ data:data , success:true}  
  end

  # @transaction
  # def approveRequestByButton
  #   data = []
  #   if !params[:request_id].nil?
  #     data  = SdnStudentRequest.find(params[:request_id])
  #     data.checker_id = session[:user_id]
  #     data.checker_date = DateTime.now
  #     data.update_attributes(status:"A")
  #     puts "Approve : ********* this is Check_id : #{data.checker_id},******* Checker Data : #{data.checker_date}"
  #     render json:{ data:data , success:true,message:"Succeesfull approve request"}
  #   else
  #     render json:{data:data,success:false,message:"Fail to approve request"}
  #   end 
  # end

  # @transaction
  def rejectRequest
    data = []
    if !params[:request_id].nil?
      data  = SdnStudentRequest.find(params[:request_id])
      data.checker_id = session[:user_id]
      data.checker_date = DateTime.now
      data.update_attributes(status:"R")
      # puts "Reject : ********* this is Check_id : #{data.checker_id},******* Checker Data : #{data.checker_date}"
    end

    render json:{ data:data , success:true}
    # else
      # render json:{data:data,success:false,message:"Fail to reject request"}
  end

  def destroy
    begin
      
    rescue Exception => e
      
    end
    data = SdnStudentRequest.find(params[:id]).destroy
    render jsons:{data:data,success:true}
    # data.update_attributes(:is_deleted => true)
    #   if  data.valid?
    #       auditrail =AuditialController.new;
    #       auditrail.create( session[:user_id] , 'Delete', 'SdnStudentRequest','delete student id =   #{data.student_id} ',"#{params[:data]}");
    #       render :json => {:data =>  data , :success => 'true' , :total => 1}
    #   else
    #     render json: { success: false, errors:  data.errors }
        
    #   end
  end
  
  def getStudents
    condition = ''
    text = params[:text]
    if !params[:text].nil? && !params[:text].empty?
      text = '%'+text+'%'
      condition += " student_no LIKE '#{text}' OR first_name LIKE '#{text}' 
                    OR last_name LIKE '#{text}' OR status LIKE '#{text}' "
      
    end
    puts("********** #{condition}")

    data = SdnStudent.select("id,student_no,first_name,last_name,status")
    data = data.where(condition)
    render json: { success: true, data:  data }
    
  end

  def getSysuser
    data = ''
    data = SysUser.select("id,user_id,user_name").where(:home_campus_id=>1)
    render json: {data:data,success:true}
  end

  private
  def permit_data
    params.require(:data).permit(
      :id,
      :request_no,
      :request_date,
      :student_id,
      :note,
      :marker_id,
      :maker_date,
      :checker_id,
      :checker_date,
      :status,
      :campus_id
    )
  end
end



