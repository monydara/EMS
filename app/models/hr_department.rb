class HrDepartment < ActiveRecord::Base
	has_many :sys_user
	has_many :hr_employee , foreign_key:'department_id'
	
end
