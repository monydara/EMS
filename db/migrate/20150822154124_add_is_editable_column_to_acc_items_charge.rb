class AddIsEditableColumnToAccItemsCharge < ActiveRecord::Migration
  def up
    add_column :acc_charge_items, :is_editable, :boolean, :default=>false, after: :charge_amount
    add_column :acc_charge_items, :status, :string, limit:1, default:'A', after: :note #Status: A=Active, C=Closed
  end
  def down
    remove_column :acc_charge_items, :is_editable
    add_column :acc_charge_items, :status
  end
end
