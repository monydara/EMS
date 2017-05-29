class CreateAcdClassRooms < ActiveRecord::Migration
  def up
    create_table :acd_class_rooms do |t|
      t.string :code , :limit => 6
      t.string :name , :limit => 50
      t.string :description 
      t.integer :max_seat
      t.integer :campus_id
      t.boolean :is_deleted

      t.timestamps
    end
  end

  def down
    drop_table :acd_class_rooms
  end
end
