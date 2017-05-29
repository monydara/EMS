class AddColumnReferenceNoToSdnAdmission < ActiveRecord::Migration
  def up
    add_column :sdn_admissions , :reference_no ,:string , limit:20

  end
  def down
    remove_column :sdn_admissions , :reference_no
  end
end
