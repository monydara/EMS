class CreateSdnDocuments < ActiveRecord::Migration
  def up
    create_table :sdn_documents do |t|
      t.string :doc_name, limit:50
      t.integer :doc_type_id
      t.integer :student_id
      t.text :file_path
      t.string :orginal_file_name ,limit:100
      t.boolean :is_del, default:false
      t.timestamps
    end
  end

  def down
    drop_table :sdn_documents
  end
end
