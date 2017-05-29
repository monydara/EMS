class CreateHrPositions < ActiveRecord::Migration
  def up
    create_table :hr_positions do |t|
    	t.string 'position'
    	t.text 'description'
    	t.boolean 'is_deleted'
      t.timestamps
    end
    HrPosition.create :position => "System Administrator" , :is_deleted => false
  end
  def down
  	drop_table :hr_positions
  end
end
