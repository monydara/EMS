class AddMoreColumnsToSdnAdmission < ActiveRecord::Migration
  def up
    add_column :sdn_admissions, :tuition_time_id, :integer, after: :program_type
    add_column :sdn_admissions, :term_id , :integer, after: :tuition_time_id
    add_column :sdn_admissions, :s_level_id, :integer, after: :term_id
    add_column :sdn_admissions, :c_level_id, :integer, after: :s_level_id
  end
  def down
    remove_column :sdn_admissions, :tuition_time_id
    remove_column :sdn_admissions, :term_id
    remove_column :sdn_admissions, :s_level_id
    remove_column :sdn_admissions, :c_level_id
  end
end
