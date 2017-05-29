class AddColumnsWorkingTimeToHrEmployee < ActiveRecord::Migration
  def change
    add_column :hr_employees, :working_time,:string,:limit=>2, default: 'FT', after: :emp_type
  end
end
