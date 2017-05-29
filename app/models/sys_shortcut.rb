class SysShortcut < ActiveRecord::Base
	has_many :sys_user_shortcut,  :foreign_key =>"shortcut_id"
  has_many :sys_role_shortcut, :foreign_key => "shortcut_id"
  belongs_to :sys_menu,:foreign_key => "shortcut_id"

  has_many :sys_shortcut_menu, foreign_key: "shortcut_id"
  accepts_nested_attributes_for :sys_shortcut_menu, allow_destroy: true

end
