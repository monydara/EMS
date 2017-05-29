class AddColumnToDivision < ActiveRecord::Migration
  def up
  	add_column :acd_class_divisions , :khr_name , :string
  end

  def down
  	remove_column :acd_class_divisions , :khr_name
  end
end
