class CreateGenDistricts < ActiveRecord::Migration
  def up
    create_table :gen_districts do |t|
      t.integer :gen_city_id
      t.string :district

      t.timestamps
    end
  end

  def down
  	drop_table :gen_districts
  end
end
