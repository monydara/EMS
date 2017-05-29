class AcdBatch < ActiveRecord::Base
	belongs_to :gen_campus
	has_many :sdn_admission , :foreign_key => "batch_id"
	has_many :acd_batch_course , :foreign_key => "batch_id"
	has_many :acc_plan_master, :foreign_key => "acd_batche_id"
end
