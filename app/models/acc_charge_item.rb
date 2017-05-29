class AccChargeItem < ActiveRecord::Base
	belongs_to :acc_charge_item_type, :foreign_key => "item_type_id"
end
