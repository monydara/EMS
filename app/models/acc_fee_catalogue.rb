class AccFeeCatalogue < ActiveRecord::Base
	
	validates :catalogue_name, uniqueness:{ scope: :fiscal_year }
end
