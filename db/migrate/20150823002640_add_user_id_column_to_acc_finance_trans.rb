class AddUserIdColumnToAccFinanceTrans < ActiveRecord::Migration
  def up
    add_column :acc_finance_trans,:user_id, :integer
  end
  def down
    remove_column :acc_finance_trans, :user_id
  end
end
