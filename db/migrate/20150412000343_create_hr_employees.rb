class CreateHrEmployees < ActiveRecord::Migration
  def change
    create_table :hr_employees do |t|
      t.string :code , :limit => 6
      t.integer :title_id
      t.string :name , :limit => 100 
      t.string :khr_name , :limit => 100 
      t.string :gender , :limit => 1
      t.date :hire_date
      t.date :birth_date
      t.string :place_of_birth , :limit => 200
      t.string :emp_type , :limit => 1
      t.integer :emp_level_id
      t.integer :position_id
      t.integer :department_id
      t.integer :shift_id
      t.string :height , :limit => 10
      t.string :size , :limit => 10
      t.decimal :basic_salary
      t.string :id_card_no , :limit => 30
      t.string :passport_no, :limit => 30 
      t.integer :national_id
      t.integer :ethnicity_id
      t.integer :religion_id
      t.integer :langauge_id
      t.string :marital_status , :limit => 1
      t.string :spouse_name , :limit => 100
      t.integer :no_of_child 
      t.integer :studied_child
      t.string :house_no , :limit => 20
      t.string :street_no , :limit => 50
      t.string :group_no , :limit => 20
      t.string :village , :limit => 50
      t.integer :commune_id
      t.integer :district_id
      t.integer :city_id
      t.integer :country_id
      t.string :phone_no , :limit => 30
      t.string :email , :limit => 50
      t.string :contact_name , :limit => 100
      t.string :contact_phone, :limit => 30
      t.string :contact_address , :limit => 200
      t.string :contact_email, :limit => 50
      t.text :description
      t.string :status , :limit => 2
      t.text :photo_path
      t.integer :campus_id

      t.timestamps
    end
  end
end
