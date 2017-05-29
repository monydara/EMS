class CreateAcdDegrees < ActiveRecord::Migration
  def up
    create_table :acd_degrees do |t|
      t.string :name
      t.string :abbr
      t.string :degree_type

      t.timestamps
    end

	AcdDegree.create :name=>"English Course"	,:abbr=>"EC"	,:degree_type=>"TC"
	AcdDegree.create :name=>"Short Course"	,:abbr=>"SC"	,:degree_type=>"TC"
  AcdDegree.create :name=>"Hight Diploma" ,:abbr=>"HD"  ,:degree_type=>"WU" 
	AcdDegree.create :name=>"Associate"	,:abbr=>"AS"	,:degree_type=>"WU"	
	AcdDegree.create :name=>"Bachelor"	,:abbr=>"BA"	,:degree_type=>"WU"
	AcdDegree.create :name=>"Master"	,:abbr=>"MS"	,:degree_type=>"WU"
	AcdDegree.create :name=>"Doctor"	,:abbr=>"DC"	,:degree_type=>"WU"
  end

  def down
  	drop_table :acd_degrees
  end
end
