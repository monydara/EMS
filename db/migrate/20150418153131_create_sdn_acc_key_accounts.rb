class CreateSdnAccKeyAccounts < ActiveRecord::Migration
  def up
    create_table :sdn_acc_key_accounts do |t|
    	t.string :code, limit:6
    	t.string :name, limit:100
    	t.string :refer_type, limit:1, default:"O" # S Refer to student, E Refer to employee and O Refer to other people
    	t.integer :campus_id
      t.timestamps
    end
  end
  def down
  	drop_table :sdn_acc_key_accounts
  end
end
