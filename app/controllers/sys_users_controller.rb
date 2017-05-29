class SysUsersController < ApplicationController

  @@common = CommonFunction.new
  def index

    if !params[:searchKeyword].nil?
      searchKeyword = "%#{params[:searchKeyword]}%"
      data = 	SysUser.joins(:hr_position,:hr_department,:cfg_look_up,:gen_campus
      ).where("sys_users.user_id like '#{searchKeyword}' or
               sys_users.user_name like '#{searchKeyword}' or
               hr_positions.position like '#{searchKeyword}' or
               hr_departments.department like '#{searchKeyword}' or
               cfg_look_ups.name like '#{searchKeyword}' or
               sys_users.address like '#{searchKeyword}' or
               sys_users.phone like '#{searchKeyword}' or
               sys_users.email like '#{searchKeyword}' or
               sys_users.user_type like '#{searchKeyword}'
              ").select("sys_users.*,hr_positions.position,hr_departments.department,cfg_look_ups.name as status,gen_campus.campus_name as home_campus ")
    else
      data = 	SysUser.joins(:hr_position,:hr_department,:cfg_look_up,:gen_campus
      ).select("sys_users.*,hr_positions.position,hr_departments.department,cfg_look_ups.name as status,gen_campus.campus_name as home_campus ")
    end



    render @@common.returnJoinPaginate(  SysUser ,data, params[:page],params[:limit])
	end
  def change_password
    
    oldPassword = params[:OldPassword] 
    newPassword = params[:NewPassword]
    @user = SysUser.new 
    @user.password = oldPassword
    @data= SysUser.find_by encrypted_password: @user.encrypted_password , id:session[:user_id]
    puts "======== #{@user.encrypted_password } , #{session[:user_id]} , #{newPassword}"
    if !@data.nil?
      @data.password  = newPassword 
      @data.save 
     render json:{data:@data ,success:true , message:'Password changeed sucess.'}
   else
    render json:{success:false , message:"Incorrect old password"}
    end

  end

	def create

    @data=params[:data]

    if !SysUser.exists?(user_id:@data[:user_id])
      @user = SysUser.new(permit_data)

      auditrail = AuditialController.new;
      if @user.save
        auditrail.create( session[:user_id] , 'Create', 'SysUser',"create new user name =   #{@user.user_name}","#{params}");
        render $util.returnSave(@user)
      else
        auditrail.create( session[:user_id] , 'Create', 'SysUser',"Fail to create user name =   #{@user.user_name}","#{params}");
        render json: { success: false, errors:  @user.errors, message:'Failure to create major.' }
      end
    else
        render json: { success: false, message: 'User ID already exists.'}
    end
  end

  def update
    @data = SysUser.find((params[:id]))
    @data.update_attributes(permit_data)
    auditrail =AuditialController.new;
    if  @data.valid?
      auditrail.create( session[:user_id] , 'Update', 'SysUser',"Update user name =   #{@data.user_name}"," #{params}");
      render $util.returnSave(@data)
    else
      auditrail.create( session[:user_id] , 'Update', 'SysUser',"Fail to update user name=   #{@data.user_name}"," #{params}");
      render json: { success: false, errors:  @data.errors ,message:'Failure to update major data.'}
    end
  end

  def user_degrees
    user_id=params[:userId]
    if !user_id.nil?
      data = SysUserDegree.joins(:acd_degree).select("sys_user_degrees.*,acd_degrees.name").where(user_id:user_id)
    else
      data = SysUserDegree.joins(:acd_degree).select("sys_user_degrees.*,acd_degrees.name").where(user_id:0)
    end
    render json:{ data:data, success:true}
  end

  def UserRoles
      user_id=params[:userId]
      if !user_id.nil?
          data = SysRoleUser.joins(:sys_role).select("sys_role_users.*, sys_roles.name").where(user_id:user_id)
      else
        data = SysRoleUser.joins(:sys_role).select("sys_role_users.*, sys_roles.name").where(user_id:0)
      end
      render json:{ data:data, success:true}
  end

  def UserLocations
      user_id=params[:userId]
      if !user_id.nil?
        data = SysUserLocation.joins(:gen_campus).select("sys_user_locations.*,gen_campus.campus_name as name").where(user_id:user_id)
      else
        data = SysUserLocation.joins(:gen_campus).select("sys_user_locations.*,gen_campus.campus_name as name").where(user_id:0)
      end
      render json:{ data:data, success:true}
  end

  private
  def permit_data
    params.require(:data).permit(
        :id,
        :user_id,
        :user_name,
        :password,
        :hr_position_id,
        :hr_department_id,
        :address,
        :phone,
        :email,
        :description,
        :home_campus_id,
        :user_type,
        :status_id,
        :start_date,
        sys_role_user_attributes: [:id,:user_id , :role_id,:_destroy],
        sys_user_location_attributes: [:id ,:user_id , :campus_id,:_destroy],
        sys_user_degree_attributes:[:id,:user_id,:degree_id,:_destroy]
    )

  end
end
