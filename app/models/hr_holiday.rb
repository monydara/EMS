class HrHoliday < ActiveRecord::Base
	belongs_to :cfg_academic_year ,foreign_key: 'academic_year_id'	
end
