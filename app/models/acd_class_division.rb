class AcdClassDivision < ActiveRecord::Base
	has_many :acd_standard_division , :foreign_key => "division_id"
	has_many :acd_class_wu_detial , :foreign_key => "division_id"
	has_many :acd_class_wus , :foreign_key => "division_id"
end
