class ShortcutsController < ApplicationController

  def index
=begin
    data = SysShortcut.find_by_sql("select s.* from sys_shortcuts s
          inner join sys_role_shortcuts rs on s.id=rs.shortcut_id
          inner join sys_role_users ru on rs.role_id=ru.role_id
          where ru.user_id=#{session[:user_id]}")
=end
    data = SysShortcut.all
		render :json => { :data =>  data , :success => 'true'}
  end

  def update

    SysShortcut.transaction do
      data = SysShortcut.find(params[:id])
      data.update_attributes(permit_data)
      render json:{ data:data , success:true  }
    end

  end

  private
  def permit_data
    params.permit(
        :id,
        sys_shortcut_menu_attributes:[:id,:shortcut_id,:role_id ,:menu_id,:_destroy]
    )
  end

end
