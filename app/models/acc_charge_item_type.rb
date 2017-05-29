class AccChargeItemType < ActiveRecord::Base
	has_many :acc_receipts
	has_many :acc_charge_items , :foreign_key => "item_type_id"
end
