class SysUserLocation < ActiveRecord::Base
  belongs_to :gen_campus, foreign_key: "campus_id"
  belongs_to :sys_user , foreign_key: "user_id"
end
