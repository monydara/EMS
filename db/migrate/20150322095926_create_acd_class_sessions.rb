class CreateAcdClassSessions < ActiveRecord::Migration
  def up
    create_table :acd_class_sessions do |t|
    	t.string :code , :limit => 6
    	t.string :name , :limit => 50
      t.timestamps
    end

    AcdClassSession.create code:'M' ,name:'Morning' 
    AcdClassSession.create code:'A' ,name:'Afternoon' 
    AcdClassSession.create code:'E' ,name:'Evening' 
    AcdClassSession.create code:'N' ,name:'Night' 
    AcdClassSession.create code:'W' ,name:'Weekend' 

  end

  def down
  	drop_table :acd_class_sessions
  end
end
