class ChangeFeePlansBatchDegreeCourseIds < ActiveRecord::Migration
  def up
  	rename_column :acc_fee_plans , :batch_id , :acd_batche_id
  	rename_column :acc_fee_plans , :degree_id , :acd_degree_id
  	rename_column :acc_fee_plans , :course_id , :acd_course_facultie_id
  end
  def down
  	rename_column :acc_fee_plans , :acd_batche_id , :batch_id
  	rename_column :acc_fee_plans , :acd_degree_id , :degree_id
  	rename_column :acc_fee_plans , :acd_course_facultie_id , :course_id
  end
end
