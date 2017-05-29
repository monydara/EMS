class AccFeePlan < ActiveRecord::Base
	validates :plan_code ,uniqueness:true
	has_many :acc_fee_plan_detail, foreign_key:"plan_id"
	belongs_to :acc_plan_master
	belongs_to :acd_degree, :foreign_key => "degree_id"
	belongs_to :acd_course_faculty, :foreign_key => "course_id"
end
