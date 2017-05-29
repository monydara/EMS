class GenCity < ActiveRecord::Base
	belongs_to :gen_country
	has_many :gen_district
	has_many :gen_commune
end
