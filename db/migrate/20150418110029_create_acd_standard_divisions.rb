class CreateAcdStandardDivisions < ActiveRecord::Migration
  def up
    create_table :acd_standard_divisions do |t|
      t.integer :standard_id
      t.integer :division_id

      t.timestamps
    end
  end
  def down
  	drop_table :acd_standard_divisions
  end
end
