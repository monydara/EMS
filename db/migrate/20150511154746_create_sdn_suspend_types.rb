class CreateSdnSuspendTypes < ActiveRecord::Migration
  def up
    create_table :sdn_suspend_types do |t|
      t.string :code, limit:6
      t.string :name, limit:50
      t.string :description, limit:250
      t.boolean :is_deleted, default:false
      t.timestamps
    end
  end
  def down
    drop_table :sdn_suspend_types
  end
end
