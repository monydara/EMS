class CreateExmAssessmentRuleDetails < ActiveRecord::Migration
  def up
    create_table :exm_assessment_rule_details do |t|
    	t.integer :assessment_rule_id
    	t.integer :assessment_type_id
    	t.integer :rate_p
    	t.decimal :rate_value
    	t.boolean :is_deleted,default:false
      	t.timestamps
    end
  end
  def down
  	drop_table :exm_assessment_rule_details
  end
end
