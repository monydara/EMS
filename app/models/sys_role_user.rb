class SysRoleUser < ActiveRecord::Base
	belongs_to :sys_role, :foreign_key =>"role_id"
	belongs_to :sys_user, :foreign_key =>"user_id"
	
end
