class SysRole < ActiveRecord::Base
	has_many :sys_shortcut_menu,  :foreign_key =>"role_id"
  has_many :sys_role_shortcut, :foreign_key => "role_id"
	has_many :sys_role_user,  :foreign_key =>"role_id"
	has_many :sys_menu, :through => :sys_shortcut_menu

  accepts_nested_attributes_for :sys_role_user,:allow_destroy => true
  accepts_nested_attributes_for :sys_role_shortcut,:allow_destroy => true

end
