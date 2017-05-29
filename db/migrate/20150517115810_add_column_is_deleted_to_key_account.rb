class AddColumnIsDeletedToKeyAccount < ActiveRecord::Migration
  def up
    add_column :sdn_acc_key_accounts, :is_deleted, :boolean, :default => false,before: :campus_id
  end
  def down
    remove_column :sdn_acc_key_accounts, :is_deleted
  end
end
