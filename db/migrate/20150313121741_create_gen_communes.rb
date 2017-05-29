class CreateGenCommunes < ActiveRecord::Migration
  def up
    create_table :gen_communes do |t|
      t.integer :gen_district_id
      t.integer :gen_city_id
      t.string :commune

      t.timestamps
    end
  end

  def down
  	drop_table :gen_communes
  end
end
