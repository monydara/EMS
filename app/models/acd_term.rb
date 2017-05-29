class AcdTerm < ActiveRecord::Base
	has_many :acd_class_tc , :foreign_key => "term_id"
	has_many :sdn_admission , :foreign_key => "term_id"
end
