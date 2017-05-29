class SysUser < ActiveRecord::Base

 attr_encrypted :password, :key => 'Secret#EMS**V1234500/'

	belongs_to :hr_position
	belongs_to :hr_department
	belongs_to :cfg_look_up, :foreign_key=>"status_id"
  belongs_to :gen_campus, :foreign_key => "home_campus_id"
  has_many :acc_cash_drawer

  has_many :sys_user_shortcut, :foreign_key=>"user_id"
	has_many :sys_role_user, :foreign_key =>"user_id"
	has_many :sys_user_location, :foreign_key => "user_id"
  has_many :sys_user_degree, :foreign_key => "user_id"

  
  has_many :sdn_student_request, :foreign_key => "marker_id"
  has_many :sdn_student_request, :foreign_key => "checker_id"
  

  has_many :sdn_status_log , :foreign_key=> "status_by_id"  # id of user that done the record Drop,Suspen,or Reactive

  accepts_nested_attributes_for :sys_role_user,:allow_destroy => true
  accepts_nested_attributes_for :sys_user_degree,:allow_destroy => true
  accepts_nested_attributes_for :sys_user_location,:allow_destroy => true
end
