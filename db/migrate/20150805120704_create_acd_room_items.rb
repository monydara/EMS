class CreateAcdRoomItems < ActiveRecord::Migration
  def up
    create_table :acd_room_items do |t|
      t.integer :room_id
      t.integer :item_id
      t.integer :qty, default:0
      t.string  :stock_type, default:'I' # I=In Stock , O=Out Stock
      t.integer :stock_by_id
      t.boolean :is_deleted, default:false
      t.timestamps
    end
  end
  def down
    drop_table :acd_room_items
  end
end
