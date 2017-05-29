class AddColumnDegreeStandardRelToStandardDivision < ActiveRecord::Migration
  def up
  	add_column :acd_standard_divisions , :stand_degree_id , :integer , after: :division_id
  end
  def down
  	remove_column :acd_standard_divisions , :stand_degree_id 
  	
  end
end
