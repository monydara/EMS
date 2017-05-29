class DegreeStandard < ActiveRecord::Base
	belongs_to :acd_degree , :foreign_key => "degree_id"
	belongs_to :acd_standard , :foreign_key => "standard_id"
	has_many :acd_standard_division , :foreign_key => "stand_degree_id"
end
