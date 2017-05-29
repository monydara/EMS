class RemoveAttactFileInStudent < ActiveRecord::Migration
  def up
  	remove_attachment :sdn_students, :image
  	add_column :sdn_students , :image_url, :string  , after: :note
  end

end
