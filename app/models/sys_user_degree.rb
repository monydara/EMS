class SysUserDegree < ActiveRecord::Base
  belongs_to :sys_user, :foreign_key =>"user_id"
  belongs_to :acd_degree, :foreign_key =>"degree_id"
end
