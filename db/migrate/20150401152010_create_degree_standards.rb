class CreateDegreeStandards < ActiveRecord::Migration
  def up
    create_table :degree_standards do |t|
      t.integer :degree_id
      t.integer :standard_id

      t.timestamps
    end
  end

  def down
  	drop_table :degree_standards
  end
end
