class CreateAcdClassShifts < ActiveRecord::Migration
  def up
   
    create_table :acd_class_shifts do |t|
        t.string :code , :limit => 6
        t.string :name , :limit => 50
        t.string :khr_name , :limit => 50

      t.timestamps
    end

    # AcdClassShift.create :code => "MORN", :name => "Morning", :khr_name =>"ពេលព្រឹក"
    # AcdClassShift.create :code => "AFTN", :name => "Afternoon", :khr_name =>"ពេលថ្ងៃ"
    # AcdClassShift.create :code => "EVEN", :name => "Evening", :khr_name =>"ពេលល្ងាច"
    # AcdClassShift.create :code => "WKND", :name => "Weekend", :khr_name =>"ចុងសប្តាហ៍"
  end

  def down
  	drop_table :acd_class_shifts
  end
end
