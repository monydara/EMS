class CreateSysUserCampus < ActiveRecord::Migration
  def up
    create_table :sys_user_campus do |t|
    	t.integer 'sys_user_id'
    	t.integer 'gen_campus_id'
      t.timestamps
    end

    SysUserCampus.create :sys_user_id => 1, :gen_campus_id =>1
  end


  def down
  	drop_table :sys_user_campus
  end
end
