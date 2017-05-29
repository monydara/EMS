class ChangeDataTypeClassTc < ActiveRecord::Migration
  def up
  	change_column :acd_class_tcs , :study_start_time , :string
  end
  def down
  	change_column :acd_class_tcs , :study_start_time , :datetime
  	
  end
end
