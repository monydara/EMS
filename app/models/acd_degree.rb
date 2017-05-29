class AcdDegree < ActiveRecord::Base
	#has_many :acd_degree_course , :foreign_key => "batch_id"
	has_many :acd_degree_course , :foreign_key => "degree_id"
	has_many :degree_standard , :foreign_key => "degree_id"
	has_many :acd_class_tc  ,:foreign_key => 'degree_id'
	has_many :acd_class_wu  ,:foreign_key => 'degree_id'
	has_many :sdn_lead , :foreign_key => "degree_id"

	has_many :acc_fee_plans, :foreign_key => "acd_degree_id"
    has_many :acc_tc_fee_plan, foreign_key:'degree_id'
    has_many :sys_user_degree,  :foreign_key =>"degree_id"

    	# add by channa for Student movement
    has_many :sdn_admission,  :foreign_key => "degree_id"
    has_many :sdn_status_log,  :foreign_key => "degree_id"
end
