class CreateAccTranTypes < ActiveRecord::Migration
  def up
    create_table :acc_tran_types do |t|
    	t.string	:code, limit:6
    	t.string 	:tran_type_desc, limit:50
    	t.boolean	:is_negative, default:0
      	t.timestamps
    end
  end
  def down
  	drop_table :acc_tran_types
  end
end
