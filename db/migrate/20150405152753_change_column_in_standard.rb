class ChangeColumnInStandard < ActiveRecord::Migration
  def up
  	remove_column :acd_standards , :gen_campus_id
  	remove_column :acd_standards , :created_by
  	add_column :acd_standards , :khr_name , :string 
  end

  def down
  	add_column :acd_standards , :gen_campus_id , :integer
  	add_column :acd_standards , :created_by , :integer
  	remove_column :acd_standards , :khr_name
  end
end
