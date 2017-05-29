class CreateSdnLeads < ActiveRecord::Migration
  def up
    create_table :sdn_leads do |t|
    	t.integer "title_id"
    	t.string "first_name",:limit=>50,:default=>"",:null=>false
    	t.string "last_name",:limit=>50,:default=>"", :null=>false
    	t.string "khr_first_name",:limit=>50,:default=>"", :null=>false
    	t.string "khr_last_name",:limit=>50,:default=>"", :null=>false
    	t.string "gender",:limit=>1,:default=>"M", :null=>false
    	t.date "date_of_birth"
    	t.date "registered_date"
    	t.string "place_of_birth",:default=>"",:null=>false
    	t.string "phone_no",:limit=>35,:default=>"",:null=>false
    	t.string "email",:default=>"",:null=>false
    	t.string "address",:default=>"",:null=>false
    	t.text	"note"
    	t.text	"photo_path"
    	t.integer "degree_id"
    	t.integer "course_id"
    	t.integer "class_shift_id"
    	t.boolean "is_canceled"
    	t.integer "campus_id"

      t.timestamps
    end
  end

  def down
  	drop_table :sdn_leads
  end
end
