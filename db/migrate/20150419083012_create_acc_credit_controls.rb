class CreateAccCreditControls < ActiveRecord::Migration
  def up
    create_table :acc_credit_controls do |t|
    	t.string :policy_name, limit:50
    	t.integer :due_days
    	t.text	:description 
    	t.boolean :is_active, default:false
    	t.boolean :is_del,default:false
    	t.integer :campus_id
      t.timestamps
    end
  end

  def down
  	drop_table :acc_credit_controls 
  end
end
