class AcdStandardDivision < ActiveRecord::Base
	belongs_to :acd_standard , :foreign_key => "standard_id"
	belongs_to :acd_class_division , :foreign_key => "division_id"
	belongs_to :degree_standard , :foreign_key => "stand_degree_id" 
end
