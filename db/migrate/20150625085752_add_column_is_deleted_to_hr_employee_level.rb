class AddColumnIsDeletedToHrEmployeeLevel < ActiveRecord::Migration
  def up
    add_column :hr_employee_levels, :is_deleted, :boolean, :default => false, after: :level_value
    add_column :hr_employee_shifts, :is_deleted, :boolean, :default => false, after: :campus_id
  end

  def down
    remove_column :hr_employee_levels, :is_deleted
    remove_column :hr_employee_shifts, :is_deleted
  end
end
