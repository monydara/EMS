class AcdStandard < ActiveRecord::Base
	has_many :degree_standard , :foreign_key => "standard_id"
	has_many :acd_standard_division , :foreign_key => "standard_id"
	has_many :acd_class_wu , :foreign_key => "standard_id"

end
