class CreateAccPaymentMethods < ActiveRecord::Migration
  def up
    create_table :acc_payment_methods do |t|
    	t.string	:code, limit:6
    	t.string	:name, limit:50
    	t.string	:method_type, limit:1
    	t.boolean 	:is_del, default:0
      	t.timestamps
    end
  end
  def down
  	drop_table :acc_payment_methods
  end
end
