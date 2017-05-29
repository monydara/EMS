class CreateHrEmployeeLevels < ActiveRecord::Migration
  def up
    create_table :hr_employee_levels do |t|
      t.string :emp_level, :limit=>50
      t.string :khr_emp_level, :limit=>50
      t.integer :level_value, default:0
      t.timestamps
    end
  end

  def down
    drop_table :hr_employee_levels
  end
end
