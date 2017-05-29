class AccFeePlanDetail < ActiveRecord::Base
	belongs_to :acc_fee_plan , foreign_key:"plan_id"
	validates :plan_id ,uniqueness:{ scope: [:term_id, :cycle_type_id] , message:"is already exist in system"} 
end
