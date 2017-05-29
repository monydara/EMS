class CreateGenCities < ActiveRecord::Migration
  def up
    create_table :gen_cities do |t|
      t.integer :gen_country_id
      t.string :city

      t.timestamps
    end
  end

  def down
  	drop_table :gen_cities
  end
end
