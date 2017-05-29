class AddColumnToAcademicYear < ActiveRecord::Migration
  def up
      add_column :cfg_academic_years, :is_deleted, :boolean, after: :user_id
  end

  def down
      remove_column :cfg_academic_years, :is_deleted, :boolean
  end
end
