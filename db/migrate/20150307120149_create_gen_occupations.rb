class CreateGenOccupations < ActiveRecord::Migration
  def up
    create_table :gen_occupations do |t|
      t.string :name
      t.string :khr
      t.boolean :is_deleted

      t.timestamps
    end
  end
  def down
  	drop_table :gen_occupations
  end
end
