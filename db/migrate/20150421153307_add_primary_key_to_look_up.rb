class AddPrimaryKeyToLookUp < ActiveRecord::Migration
  def up
  	add_column :cfg_look_ups , :code , :string , after: :id
  end
  def down
  	remove_column :cfg_look_ups , :code 
  	
  end
end
