class AddAndRemoveEndDateAccSubAccount < ActiveRecord::Migration
  def change
    remove_column :acc_sub_accounts, :end_end
    add_column :acc_sub_accounts, :end_date,:date, after: :start_date
  end
end
