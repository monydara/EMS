class CreateSdnStudentCategories < ActiveRecord::Migration
  def up
    create_table :sdn_categories do |t|
      t.string :code
      t.string :name
      t.text :description
      t.boolean :is_deleted

      t.timestamps
    end
    
	SdnCategory.create code: "INDIVD",name: "Individual", is_deleted: false
	SdnCategory.create code: "CORPRT",name: "Corporate", is_deleted: false
  SdnCategory.create code: "BANK", name: "Bank", is_deleted: false
	SdnCategory.create code: "NGO",name: "NGO", is_deleted: false
	SdnCategory.create code: "GOVMNT",name: "Goverment", is_deleted: false
	SdnCategory.create code: "BUSS",name: "Bussiness", is_deleted: false
	SdnCategory.create code: "EMBS",name: "Embassy", is_deleted: false
	SdnCategory.create code: "OTHER",name: "Others", is_deleted: false

  end

  def down
  	drop_table :sdn_categories
  end
end
