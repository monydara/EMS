class CreateExmAssessmentRules < ActiveRecord::Migration
  def up
    create_table :exm_assessment_rules do |t|
    	t.string :rule_code,limit:6
    	t.string :rule_name,limit:50
    	t.string :status,limit:1,defult:'A' # A=Active , I=Inactive
    	t.integer :campus_id
    	t.integer :user_id
      t.timestamps
    end
  end
  def down
  	drop_table :exm_assessment_rules
  end
end
