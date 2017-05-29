class CreateAcdStandards < ActiveRecord::Migration
  def change
    create_table :acd_standards do |t|
      t.string :code
      t.string :name
      t.integer :sequence
      t.boolean :is_deleted
      t.integer :gen_campus_id
      t.integer :created_by

      t.timestamps
    end
  end
end
