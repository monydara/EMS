class AddColDescriptionToHrEmployeeLevel < ActiveRecord::Migration
  def up
    add_column :hr_employee_levels, :description,:text, after: :khr_emp_level
  end
  def down
    remove_column :hr_employee_levels, :description
  end
end
