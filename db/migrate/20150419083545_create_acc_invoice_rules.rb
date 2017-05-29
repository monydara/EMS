class CreateAccInvoiceRules < ActiveRecord::Migration
  def up
    create_table :acc_invoice_rules do |t|
    	t.string :rule_name, limit:50
    	t.integer :from_days, default:0
    	t.integer :to_days, default:0
    	t.integer :credit_control_id
    	t.integer :alert_type_id
    	t.integer :action_type_id
    	t.text	  :description
    	t.boolean :is_active, default:true
    	t.boolean :is_del,default:false

      t.timestamps
    end
  end

  def down
  	drop_table :acc_invoice_rules
  end
end
