class CreateAccCycleTypes < ActiveRecord::Migration
  def up
    create_table :acc_cycle_types do |t|
    	t.string :cycle_code, limit:6, null:false
    	t.string :cycle_name, limit:50
    	t.integer :cycle_value, default:0
    	t.integer :cycle_per_class, default:0
      t.timestamps
    end

    AccCycleType.create :cycle_code=>"MON01",:cycle_name=>"Monthly",:cycle_value=>"1",:cycle_per_class=>"10"
    AccCycleType.create :cycle_code=>"QAT03",:cycle_name=>"Qaurterly",:cycle_value=>"3",:cycle_per_class=>"4"
    AccCycleType.create :cycle_code=>"SMT06",:cycle_name=>"Semesterly",:cycle_value=>"6",:cycle_per_class=>"2"
    AccCycleType.create :cycle_code=>"YER12",:cycle_name=>"Yearly",:cycle_value=>"12",:cycle_per_class=>"1"
    AccCycleType.create :cycle_code=>"FULLY",:cycle_name=>"Fully",:cycle_value=>"0",:cycle_per_class=>"0"
  end


  def down
  	drop_table :acc_cycle_types
  end
end
