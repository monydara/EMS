class CreateSdnContacts < ActiveRecord::Migration
  def up
    create_table :sdn_contacts do |t|
      t.integer :student_id
      t.integer :title_id
      t.string :contact_type, limit:2, default:""
      t.string :contact_name, limit:100
      t.string :gender, limit:1, default:"M"
      t.text   :address 
      t.string :email, limit:100, default:""
      t.string :phone, limit:50

      t.timestamps
    end
  end

  def down
     drop_table :sdn_contacts
  end
end
