class SysRoleShortcut < ActiveRecord::Base
  belongs_to :sys_shortcut, :foreign_key => "shortcut_id"
end
