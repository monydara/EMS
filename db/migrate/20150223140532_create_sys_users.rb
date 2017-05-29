class CreateSysUsers < ActiveRecord::Migration
  def up
    create_table :sys_users do |t|
    	t.string 'user_code'
    	t.string 'user_name'
    	t.string 'password'
    	t.integer 'hr_position_id'
    	t.integer 'hr_department_id'
    	t.string 'address'
    	t.string 'phone'
    	t.string 'email'
    	t.text 'description'
    	t.boolean 'is_admin'
    	t.integer 'status_id'
      t.timestamps
    end
    SysUser.create :user_code => 'admin', :user_name => 'System Admin' ,:password => 'e10adc3949ba59abbe56e057f20f883e', :hr_position_id => 1 , :hr_department_id => 1 , :is_admin => true , :status_id => 1 

  end

  def down
  	drop_table :sys_users
  	
  end
end
