class SecurityController < ApplicationController::UtilController

	def login
		auditrail =AuditialController.new;

    user = SysUser.find_by(user_id: params[:userId])

    campus = GenCampus.find_by(:id=>user.home_campus_id)


		if user && user.password == params[:password]
			session[:user_id] = user.id
			session[:username] = user.user_id
			session[:campus_id] = user.home_campus_id
			auditrail.create(user.id, 'Login', 'System','Login System', '');

      render :json => {branch:campus.campus_name,:success => true ,:message => 'The user is logged in.' }
		else
			render :json => {:success => false ,:message => 'Incorrect Username or password' }
    end

	end

  def logout_user
    reset_session
    #data=get_shortcut_by_user_id()
    #render $util.extjs_ok(data)
    render  :json => { :data =>  nil , :success => 'true'}
  end

  def get_shortcut_by_user_id
    if !session[:user_id].nil?
      data = SysShortcut.find_by_sql("select s.* from sys_shortcuts s
          inner join sys_role_shortcuts rs on s.id=rs.shortcut_id
          inner join sys_role_users ru on rs.role_id=ru.role_id
          where ru.user_id=#{session[:user_id]} order by s.id")
    else
      data = SysShortcut.where(:id=>0)
    end
      render :json => { :data =>  data , :success => 'true'}
  end

	def menu_student
    user_id=session[:user_id]
    if user_id==1
      data= SysMenu.where(:module => 'Student').order(:order_val)
    else
      data= SysMenu.joins(:sys_shortcut_menu,:sys_role_user)
                   .select('sys_menus.*')
                   .where("sys_role_users.user_id=#{user_id} and sys_menus.shortcut_id=1")
    end
		render  :json => { :data =>  data , :success => 'true'}
  end

  def menu_academic
    user_id=session[:user_id]
    if user_id==1
      data= SysMenu.where(:module => 'Academic').order(:order_val)
    else
      data= SysMenu.joins(:sys_shortcut_menu,:sys_role_user)
      .select('sys_menus.*')
      .where("sys_role_users.user_id=#{user_id} and sys_menus.shortcut_id=2")
    end
    render  :json => { :data =>  data , :success => 'true'}

  end

  def menu_exam
    user_id=session[:user_id]
    if user_id==1
      data= SysMenu.where(:module => 'Exam').order(:order_val)
    else
      data= SysMenu.joins(:sys_shortcut_menu,:sys_role_user)
      .select('sys_menus.*')
      .where("sys_role_users.user_id=#{user_id} and sys_menus.shortcut_id=5")
    end
    render  :json => { :data =>  data , :success => 'true'}

  end

  def menu_account
    user_id=session[:user_id]
    if user_id==1
      data= SysMenu.where(:module => 'Account').order(:order_val)
    else
      data= SysMenu.joins(:sys_shortcut_menu,:sys_role_user)
      .select('sys_menus.*')
      .where("sys_role_users.user_id=#{user_id} and sys_menus.shortcut_id=3")
    end
    render  :json => { :data =>  data , :success => 'true'}
  end

	def menu_admin
    user_id=session[:user_id]
    if user_id==1
      data= SysMenu.where(:module => 'Admin').order(:order_val)
    else
      data= SysMenu.joins(:sys_shortcut_menu,:sys_role_user)
      .select('sys_menus.*')
      .where("sys_role_users.user_id=#{user_id} and sys_menus.shortcut_id=7")
    end
    render  :json => { :data =>  data , :success => 'true'}
  end

  def menu_hr
    user_id=session[:user_id]
    if user_id ==1
      data= SysMenu.where(:module => 'HR').order(:order_val)
    else
      data= SysMenu.joins(:sys_shortcut_menu,:sys_role_user)
      .select('sys_menus.*')
      .where("sys_role_users.user_id=#{user_id} and sys_menus.shortcut_id=6")
    end
    render  :json => { :data =>  data , :success => 'true'}
  end



end
