class AddAvatarFieldToSdnDocument < ActiveRecord::Migration
  def up
    add_attachment :sdn_documents, :avatar
    add_column :sdn_documents , :tmp_emp_id , :integer
  end

  def down
    # remove_attachment :sdn_documents, :avatar
    # remove_column :sdn_documents , :tmp_emp_id
  end
end
