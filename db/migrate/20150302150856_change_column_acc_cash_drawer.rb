class ChangeColumnAccCashDrawer < ActiveRecord::Migration
  def up
  	rename_column :acc_cash_drawers , :user_id , :sys_user_id

  end

  def down
  	rename_column :acc_cash_drawers , :sys_user_id , :user_id
  end
end
