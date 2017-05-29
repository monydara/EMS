class GenDistrict < ActiveRecord::Base
	belongs_to :gen_city
	has_many :gen_commune
end
