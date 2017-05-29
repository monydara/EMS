class CreateHrHolidays < ActiveRecord::Migration
  def up
    create_table :hr_holidays do |t|
      t.string      :code, limit:6, null:false
      t.string      :name, limit:50, null:false
      t.string      :khr_name, limit:50, null:false
      t.date        :start_date
      t.date        :end_date
      t.integer     :academic_year_id
      t.text        :description
      t.boolean     :is_deleted, default:false
      t.integer     :campus_id
      t.timestamps
    end
  end

  def down
    drop_table :hr_holidays
  end
end
