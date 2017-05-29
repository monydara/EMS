class CreateGenCampus < ActiveRecord::Migration
  def up
    create_table :gen_campus do |t|
      t.string :campus_code
      t.string :campus_name
      t.string :abbr
      t.string :address
      t.string :email
      t.string :phone
      t.string :director
      t.datetime :start_date
      t.boolean :is_deleted
      t.string :status

      t.timestamps
    end
  end

  def down
    drop_table :gen_campus
    
  end
end
