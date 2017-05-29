class RenameColumnToAccPrePayment < ActiveRecord::Migration
  def change
    rename_column :acc_pre_payments,:remake,:remark
  end
end
