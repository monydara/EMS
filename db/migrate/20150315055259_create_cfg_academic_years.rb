class CreateCfgAcademicYears < ActiveRecord::Migration
  def up
    create_table :cfg_academic_years do |t|
      t.string :code
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :gen_campus_id
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :cfg_academic_years
  end
end
