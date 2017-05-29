class CreateGenCountries < ActiveRecord::Migration
  def up
    create_table :gen_countries do |t|
      t.string :country

      t.timestamps
    end
  end
  def down
  	drop_table :gen_countries
  end
end
