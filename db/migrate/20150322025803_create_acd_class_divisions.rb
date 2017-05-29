class CreateAcdClassDivisions < ActiveRecord::Migration
  def up
    create_table :acd_class_divisions do |t|
    	t.string :code ,:limit => 6
    	t.string :name , :limit => 50
    	t.integer :sequence 
    	# t.integer :degree_id
    	t.boolean :is_deleted
      t.timestamps
    end
  end
  def down
  	drop_table :acd_class_divisions
  end
end
