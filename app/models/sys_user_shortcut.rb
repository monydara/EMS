class SysUserShortcut < ActiveRecord::Base
	belongs_to :sys_user, :foreign_key =>"user_id"
	belongs_to :sys_shortcut, :foreign_key =>"shortcut_id"
end
