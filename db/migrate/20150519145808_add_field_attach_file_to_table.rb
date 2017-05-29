class AddFieldAttachFileToTable < ActiveRecord::Migration
  def up
  	add_attachment :sdn_students, :image
  end
  def down
  	add_attachment :sdn_students, :image
  end
end
