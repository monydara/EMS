class AddColumnsToSdnStatusLog < ActiveRecord::Migration
  def up
    add_column :sdn_status_logs, :reason_type_id, :integer, after: :status_type
    add_column :sdn_status_logs, :description, :text, after: :status_by_id
  end
  def down
    remove_column :sdn_status_logs, :reason_type_id
    remove_column :sdn_status_logs, :description
  end
end
