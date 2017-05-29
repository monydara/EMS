class GenCommune < ActiveRecord::Base
	belongs_to :gen_district
	belongs_to :gen_city
end
