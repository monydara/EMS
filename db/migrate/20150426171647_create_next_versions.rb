class CreateNextVersions < ActiveRecord::Migration
  def up
    create_table :next_versions do |t|
    	t.string :n_type 
    	t.string :description
    	t.integer :next_code
    	t.integer :degit
    	t.string :prefix
      t.timestamps
    end

   / NextVersion.create :n_type => "STUDENT REQUEST" , :description => "student request certificate" , :next_code => 1 , :degit => 4 , :prefix => ""
   /
  end

  def down
  	drop_table :next_versions
  end
end
