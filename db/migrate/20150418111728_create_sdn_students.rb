class CreateSdnStudents < ActiveRecord::Migration
  def up
    create_table :sdn_students do |t|
      t.integer	:lead_id
      t.integer :category_id
      t.integer :title_id
      t.string	:first_name, limit:50,null:false
      t.string  :last_name, limit:50,null:false
      t.string	:khr_first_name, limit:50
      t.string	:khr_last_name,limit:50
      t.string	:gender, limit:1, default:"M",null:false
      t.date	:date_of_birth
      t.date    :registered_date
      t.text	:place_of_bith
      t.string	:phone_no, limit:30
      t.string	:email, limit:100
      t.text	:address
      t.integer	:occupation_id
      t.integer :national_id
      t.integer :religion_id
      t.integer	:langauge_id
      t.integer	:ethnicity_id
      t.string	:national_no, limit:30
      t.string	:passport_no, limit:30
      t.text	:note
      t.integer :campus_id

      t.timestamps
    end
  end
  def down
  	drop_table :sdn_students
  end
end
