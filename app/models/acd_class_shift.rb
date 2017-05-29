class AcdClassShift < ActiveRecord::Base
	has_many :acd_class_tc ,  :foreign_key => "session_id"
	has_many :acd_class_wu ,  :foreign_key => "class_shift_id"
	has_many :sdn_lead , :foreign_key => "class_shift_id"

	has_many :sdn_admission , :foreign_key => "class_shift_id"
	
end
