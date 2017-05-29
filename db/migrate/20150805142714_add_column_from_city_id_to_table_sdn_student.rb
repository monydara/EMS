class AddColumnFromCityIdToTableSdnStudent < ActiveRecord::Migration
  def up
    add_column :sdn_students , :from_city_id ,:integer , after: :address
  end
  def down
    remove_column :sdn_students , :from_city_id
  end
end

