class HrEmployee < ActiveRecord::Base
	has_many :acd_class_tc_detail , :foreign_key => "lecture_id"
	has_many :acd_class_wu_detail , :foreign_key => "lecturer_id"
  belongs_to :hr_employee_level , :foreign_key => "emp_level_id"
  belongs_to :hr_employee_shift , :foreign_key => "shift_id"
  belongs_to :hr_position , :foreign_key=>"position_id"
  belongs_to :hr_department , foreign_key:'department_id'

  has_many :exm_tc_score_master , :foreign_key => "teacher_id"


end
