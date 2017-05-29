class SysRolesController < ApplicationController::UtilController

  def index
    search = "%%"
    if !params[:searchKeyword].nil?
      search ="%#{params[:searchKeyword]}%"
    end
    data = 	SysRole.where(" (sys_roles.code like '#{search}' or sys_roles.name like '#{search}') and sys_roles.is_deleted=0 ").order(:id)
    render $util.returnJoinPaginate(SysRole,  data, params[:page],params[:limit])
  end

  def create
    @data=params[:data]
    if !SysRole.exists?(code:@data[:code])
      @role = SysRole.new(permit_data)
      auditrail = AuditialController.new;

      if @role.save
        auditrail.create( session[:user_id] , 'Create', 'SysRole',"create new role name =   #{@role.name}","#{params}");
        render $util.returnSave(@role)
      else
        auditrail.create( session[:user_id] , 'Create', 'SysRole',"Fail to create role name =   #{@role.name}","#{params}");
        render json: { success: false, errors:  @role.errors, message:'Failure to create role.' }
      end
    else
      render json: { success: false, message: 'Role is already exists.'}
    end
  end


  def update
    @data = SysRole.find((params[:id]))
    @data.update_attributes(permit_data)
    auditrail =AuditialController.new;

    if @data.valid?
      auditrail.create( session[:role_id] , 'Update', 'SysRole',"Update role name =   #{@data.name}"," #{params}");
      render $util.returnSave(@data)
    else
      auditrail.create( session[:role_id] , 'Update', 'SysRole',"Fail to update role name=#{@data.name}"," #{params}");
      render json: { success: false, errors:  @data.errors ,message:'Failure to update role data.'}
    end

  end

  def role_users
    role_id=params[:role_id]
    if !role_id.nil?
      data = SysRoleUser.joins(:sys_user).select("sys_role_users.*, sys_users.user_name as name,sys_users.user_id as user_id_str").where(role_id:role_id)
    else
      data = SysRoleUser.joins(:sys_user).select("sys_role_users.*, sys_users.user_name as name,sys_users.user_id as user_id_str").where(role_id:0)
    end
    render json:{ data:data, success:true}
  end

  def role_module_menus
    begin
      role_id=params[:role_id]
      shortcut_id=params[:shortcut_id]
      if !role_id.nil? && !shortcut_id.nil?
        data = SysShortcutMenu.joins(:sys_menu).select("sys_shortcut_menus.*,sys_menus.name").where(role_id:role_id,shortcut_id:shortcut_id)
      else
        data = SysShortcutMenu.joins(:sys_menu).select("sys_shortcut_menus.*,sys_menus.name").where(role_id:0,shortcut_id:0)
      end
      render json:{ data:data, success:true}
    rescue Exception=> e
      render json: { success: false,message:e.message }
      puts e.message
    end
  end

  def role_modules

    role_id=params[:role_id]

    if !role_id.nil?
      data = SysRoleShortcut.joins(:sys_shortcut).select("sys_role_shortcuts.*, sys_shortcuts.name").where(role_id:role_id)
    else
      data = SysRoleShortcut.joins(:sys_shortcut).select("sys_role_shortcuts.*, sys_shortcuts.name").where(role_id:0)
    end

    render json:{ data:data, success:true}
  end

  def comboMenuByShortcut
    begin
      shortcut_id=params[:shortcut_id]
      if !shortcut_id.nil?
        data = SysMenu.select("sys_menus.id,sys_menus.name").where(shortcut_id:shortcut_id)
      else
        data = SysMenu.select("sys_menus.id,sys_menus.name").where(shortcut_id:0)
      end
      render json:{ data:data, success:true}
    rescue Exception =>e
      render json: { success: false,message:e.message }
      puts e.message
    end
  end

  private
  def permit_data
    params.require(:data).permit(
        :id,
        :code,
        :name,
        :description,
        sys_role_user_attributes: [:id,:user_id , :role_id,:_destroy],
        sys_role_shortcut_attributes:[:id,:role_id,:shortcut_id,:_destroy]
    )
  end

end
