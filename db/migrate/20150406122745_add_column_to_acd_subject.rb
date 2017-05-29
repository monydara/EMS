class AddColumnToAcdSubject < ActiveRecord::Migration
  def up
  	add_column :acd_subjects , :credit , :integer
  	add_column :acd_subjects , :sessions , :integer
  end

  def down
  	remove_column :acd_subjects , :credit 
  	remove_column :acd_subjects , :sessions
  end
end
