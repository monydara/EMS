class SysMenu < ActiveRecord::Base
	has_many :sys_shortcut_menu,  :foreign_key =>"menu_id"
	has_many :sys_role, :through => :sys_shortcut_menu
	has_many :sys_role_user, :through => :sys_role
  has_many :sys_shortcut, :foreign_key => "shortcut_id"
end
