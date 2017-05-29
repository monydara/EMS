class CreateAuditrails < ActiveRecord::Migration
  def up
    create_table :auditrials do |t|
    	t.integer 'user_id'
    	t.string 'ad_type'
    	t.string 'module'
    	t.text 'description'
    	t.text 'data_detail'
      t.timestamps
    end
  end
  def down
  	drop_table :auditrials
  	
  end
end
