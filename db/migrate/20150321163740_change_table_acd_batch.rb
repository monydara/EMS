class ChangeTableAcdBatch < ActiveRecord::Migration
  def up
  	remove_column :acd_batches , :start_date
  	remove_column :acd_batches , :end_date
  	remove_column :acd_batches , :user_id
  end

  def down
  	add_column :acd_batches , :start_date, :date
  	add_column :acd_batches , :end_date, :date
  	add_column :acd_batches , :user_id, :integer
  end
end
