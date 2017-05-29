class AddEduTypeColToAccBillingProcessDetail < ActiveRecord::Migration
  def up
    add_column :acc_billing_process_details,:edu_type,:string,limit:2 #TC=Training Center, WU=Western University
  end
  def down
    remove_column :acc_billing_process_details,:edu_type
  end
end
