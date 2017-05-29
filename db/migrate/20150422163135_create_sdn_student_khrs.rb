class CreateSdnStudentKhrs < ActiveRecord::Migration
  def up
    create_table :sdn_student_khrs do |t|
    	t.integer :student_id
    	t.string :first_name, limit:50
    	t.string :last_name, limit:50
    	t.string :gender, limit:10
    	t.string :date_of_birth, limit:20
    	t.text    :place_of_birth
    	t.text   :address
    	t.string :phone, limit:30
    	t.string :diploma_year, limit:50
    	t.string :certificate, limit:100
    	t.string :institue, limit:100
    	t.string :institue_city, limit:100
    	t.string :city, limit:100
    	t.string :father_name, limit:100
    	t.string :mother_name, limit:100
    	t.string :occupation, limit:100

      t.timestamps
    end
  end

  def down
      drop_table :sdn_student_khrs
  end
end
