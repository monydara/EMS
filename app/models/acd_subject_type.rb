class AcdSubjectType < ActiveRecord::Base
	has_many :acd_subject , :foreign_key => "subject_type_id"
end
