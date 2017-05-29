class AddColToSdnAdmission < ActiveRecord::Migration
  def up
    add_column :sdn_admissions, :record_stat,:string, :limit => 1, default: 'O', after: :status # O=Open, C=Closed
    add_column :sdn_admissions, :class_id,:integer,after: :end_acd_year_id
  end
  def down
    remove_column :sdn_admissions, :record_stat
    remove_column :sdn_admissions, :class_id
  end
end
