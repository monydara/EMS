class AcdFacultyStandard < ActiveRecord::Base
    belongs_to :acd_standard , foreign_key:'standard_id'
end
