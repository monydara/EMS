class SdnStudent < ActiveRecord::Base
	has_many :sdn_admission , :foreign_key=>"student_id"
	has_many :sdn_contact , :foreign_key => "student_id"
	has_many :sdn_student_requests , :foreign_key => "student_id"


    has_many :sdn_document  , foreign_key:'student_id'
    has_many :sdn_class_student , foreign_key:'student_id'
    has_many :acc_student_account , foreign_key:'student_id'


	belongs_to :gen_campus , :foreign_key => "campus_id"
	belongs_to :sdn_city_state , foreign_key:"from_city_id"
	has_many :sdn_class_student ,:foreign_key => "student_id"
	has_one :sdn_student_khr , :foreign_key => "student_id"

	has_many :acd_class_wu , :through => :sdn_class_student

    accepts_nested_attributes_for :sdn_document,:allow_destroy => true

    	# for student movement
    has_many :sdn_status_log , :foreign_key => "student_id"
end
