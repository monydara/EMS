class SdnContact < ActiveRecord::Base
	belongs_to :sdn_student , :foreign_key => "student_id"
end
