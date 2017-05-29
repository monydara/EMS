class AccAccountMaster < ActiveRecord::Base
  belongs_to :sdn_student,foreign_key: 'student_id'
	belongs_to :sdn_admission , foreign_key:"admission_id"
	belongs_to :acc_cycle_type , foreign_key:'cycle_type_id'
	
	has_many :acc_account_detail , foreign_key:"account_id"
	accepts_nested_attributes_for :acc_account_detail, :allow_destroy => true	
	# validates :admission_id,  conditions: ->{ where.not()} #uniqueness:{scope: [  ]}
  validates_uniqueness_of :admission_id,uniqueness:{ scope: [:fee_plan_detail_id,:student_id] } , conditions: -> { where(status: 'A') }

end
