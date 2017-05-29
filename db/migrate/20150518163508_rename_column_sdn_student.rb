class RenameColumnSdnStudent < ActiveRecord::Migration
  def up
  	rename_column :sdn_students , :place_of_bith , :place_of_birth
  end

  
end
