class AddImageFieldToStudentLead < ActiveRecord::Migration
  def up
  	rename_column :sdn_leads , :photo_path , :image_url 

  end
end
