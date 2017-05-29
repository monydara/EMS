class AccInvoice < ActiveRecord::Base
  has_many :acc_invoice_details, foreign_key: 'invoice_id'
  belongs_to :sdn_student,foreign_key: 'student_id'
  belongs_to :acd_degree,foreign_key: 'degree_id'
  belongs_to :acd_course_faculty,foreign_key: 'course_id'
  belongs_to :cfg_academic_year,foreign_key: 'academic_year_id'
  belongs_to :acc_cycle_type,foreign_key: 'cycle_type_id'
  belongs_to :acc_student_account,foreign_key: 'account_id'
  belongs_to :acc_billing_process,foreign_key: 'billing_process_id'
  belongs_to :gen_campus,foreign_key: 'campus_id'
  belongs_to :acc_account_master , foreign_key:"account_id"
  accepts_nested_attributes_for :acc_invoice_details, :allow_destroy => true 
end
