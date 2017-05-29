class CreateHrEmployeeShifts < ActiveRecord::Migration
  def up
    create_table :hr_employee_shifts do |t|
      t.string :shift_name, :limit=>50
      t.string :shift_type, :limit=>2, :default=>'FT'
      t.string :start_time, :limit=>10
      t.string :end_time,   :limit=>10
      t.string :description, :limit=>250
      t.integer :campus_id
      t.timestamps
    end
  end
  def down
    drop_table :hr_employee_shifts
  end
end
