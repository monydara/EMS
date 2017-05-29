class RemoveColAccBatchBill < ActiveRecord::Migration
  def change
    remove_column :acc_batch_bills, :schedule_day
  end
end
