class AddColumnToClassRoom < ActiveRecord::Migration
  def up
  	add_column :acd_class_rooms , :khr_name  , :string
  end
 
  def down
  	remove_column :acd_class_rooms , :khr_name 	
  end
end
