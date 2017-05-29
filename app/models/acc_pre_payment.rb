class AccPrePayment < ActiveRecord::Base
  belongs_to :sdn_lead, foreign_key: 'lead_id'
  belongs_to :acc_finance_tran,foreign_key: 'fin_tran_id'
  belongs_to :sys_user, foreign_key: 'maker_id'
end
