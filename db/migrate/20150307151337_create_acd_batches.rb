class CreateAcdBatches < ActiveRecord::Migration
  def up
    create_table :acd_batches do |t|
      t.string :code
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :gen_campus_id
      t.boolean :is_deleted
      t.integer :user_id

      t.timestamps
    end
  end

  def down 
    drop_table :acd_batches
    
  end
end
