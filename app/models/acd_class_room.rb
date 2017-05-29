class AcdClassRoom < ActiveRecord::Base
	belongs_to :gen_campus , :foreign_key => "campus_id"
	has_many :acd_class_tc , :foreign_key => "room_id"
	has_many :acd_class_wu , :foreign_key => "room_id"
end
