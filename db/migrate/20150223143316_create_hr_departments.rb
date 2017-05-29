class CreateHrDepartments < ActiveRecord::Migration
  def up
    create_table :hr_departments do |t|
    	t.string 'department'
    	t.text 'description'
    	t.boolean 'is_deleted'
      t.timestamps
    end
    HrDepartment.create :department => 'IT Department' , :description => 'Create by system' , :is_deleted => false
  end
  def down
  	drop_table :hr_departments
  	
  end
end
