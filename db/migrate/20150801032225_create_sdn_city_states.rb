class CreateSdnCityStates < ActiveRecord::Migration
  def up
    create_table :sdn_city_states do |t|
      t.string    :city_code, limit:6, null:false
      t.string    :city_name, limit:50, null:false
      t.string    :city_name_khr, limit:50, null:false
      t.text      :description
      t.boolean   :is_deleted, default:false
      t.timestamps
    end
  end

  def down
    drop_table :sdn_city_states
  end
end
