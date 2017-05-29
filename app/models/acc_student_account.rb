class AccStudentAccount < ActiveRecord::Base
  belongs_to :acc_billing_item, :foreign_key => 'account_id'
  belongs_to :sdn_lead, :foreign_key => 'lead_id'
  belongs_to :sdn_student, :foreign_key => 'student_id'
  belongs_to :acc_credit_control, :foreign_key => 'credit_control_id'
  belongs_to :sdn_acc_key_account, :foreign_key => 'key_account_id'
  belongs_to :acc_cycle_type, :foreign_key => 'cycle_type_id'
  belongs_to :gen_campus, :foreign_key => 'campus_id'
  has_many  :acc_billing_item,:foreign_key => 'account_id'
  has_many :acc_account_batch_bill, :foreign_key => 'account_id'

  has_many :acc_sub_account, :foreign_key =>'student_account_id'

end
