class AddColBatchTypeAccBatchBill < ActiveRecord::Migration
  def change
    add_column :acc_batch_bills, :batch_type, :string, limit:2, default:'TC' ,after: :batch_bill_name# TC and WU
  end
end
