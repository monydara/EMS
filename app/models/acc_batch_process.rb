class AccBatchProcess < ActiveRecord::Base
	belongs_to :acc_group_account , foreign_key:"group_account_id"
end
