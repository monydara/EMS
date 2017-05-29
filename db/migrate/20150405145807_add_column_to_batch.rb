class AddColumnToBatch < ActiveRecord::Migration
  def up
  	add_column :acd_batches , :khr_name , :string 
  end
  def down
  	remove_column :acd_batches , :khr_name
  end
end

