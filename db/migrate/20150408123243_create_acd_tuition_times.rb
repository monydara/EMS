class CreateAcdTuitionTimes < ActiveRecord::Migration
  def up
    create_table :acd_tuition_times do |t|
      t.string :tuition_name
      t.integer :tuition_hours

      t.timestamps
    end
  end

  def down
  	drop_table :acd_tuition_times
  end
end
