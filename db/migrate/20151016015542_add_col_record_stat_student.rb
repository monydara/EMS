class AddColRecordStatStudent < ActiveRecord::Migration
  def up
    add_column :sdn_students, :record_stat, :string, :limit => 1, default: 'O' # O=Open, C=Closed
  end
  def down
    remove_column :sdn_students, :record_stat
  end
end
