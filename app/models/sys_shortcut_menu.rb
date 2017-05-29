class SysShortcutMenu < ActiveRecord::Base
	belongs_to :sys_role, :foreign_key =>"role_id"
	belongs_to :sys_shortcut, :foreign_key =>"shortcut_id"
	belongs_to :sys_menu, :foreign_key =>"menu_id"

end
