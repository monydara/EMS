class AddReferenceIdAndTableNameToAuditTrail < ActiveRecord::Migration
  def up
  	add_column :auditrials , :table_name , :string 
  	add_column :auditrials , :reference_id, :integer
  end
end
