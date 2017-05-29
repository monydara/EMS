class AddColumnToNextVersion < ActiveRecord::Migration
  def up
  	add_column :next_versions , :campus_id , :integer , after: :prefix
  end
  def down
  	
  end
end
