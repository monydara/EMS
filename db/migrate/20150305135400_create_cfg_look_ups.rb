class CreateCfgLookUps < ActiveRecord::Migration
  def up
    create_table :cfg_look_ups do |t|
    	t.string 'name'
    	t.string 'k_name'
    	t.string 'l_type'
    	t.integer 'int_val'
    	t.integer 'line_seq'
      	t.timestamps
    end

    	CfgLookUp.create :name => "Register	"	,:l_type => "STUDENT_STATUS" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Active	"	,:l_type => "STUDENT_STATUS" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Suspend	"	,:l_type => "STUDENT_STATUS" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Drop	"	,:l_type => "STUDENT_STATUS" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Cancel	"	,:l_type => "STUDENT_STATUS" ,:int_val =>	5,	:line_seq =>4
		CfgLookUp.create :name => "Finished	"	,:l_type => "STUDENT_STATUS" ,:int_val =>	6,	:line_seq =>5
		CfgLookUp.create :name => "Male	"	,:l_type => "GENDER" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Female	"	,:l_type => "GENDER" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Mr."		,:l_type => "TITLE" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Ms."		,:l_type => "TITLE" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Miss."		,:l_type => "TITLE" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Dr."		,:l_type => "TITLE" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Other	"	,:l_type => "TITLE" ,:int_val =>	5,	:line_seq =>4
		CfgLookUp.create :name => "Single	"	,:l_type => "MARITAL_STATUS" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Widows	"	,:l_type => "MARITAL_STATUS" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Maried	"	,:l_type => "MARITAL_STATUS" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Morning	"	,:l_type => "SESSION" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Afternoon	"	,:l_type => "SESSION" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Evening	"	,:l_type => "SESSION" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Weekend	"	,:l_type => "SESSION" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Father	"	,:l_type => "RELATIONSHIP" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Mother	"	,:l_type => "RELATIONSHIP" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Uncle	"	,:l_type => "RELATIONSHIP" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Aunt	"	,:l_type => "RELATIONSHIP" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Bother	"	,:l_type => "RELATIONSHIP" ,:int_val =>	5,	:line_seq =>4
		CfgLookUp.create :name => "Sister	"	,:l_type => "RELATIONSHIP" ,:int_val =>	6,	:line_seq =>5
		CfgLookUp.create :name => "Friend	"	,:l_type => "RELATIONSHIP" ,:int_val =>	7,	:line_seq =>6
		CfgLookUp.create :name => "Others	"	,:l_type => "RELATIONSHIP" ,:int_val =>	8,	:line_seq =>7
		CfgLookUp.create :name => "Active	"	,:l_type => "USER_STATUS" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Locked	"	,:l_type => "USER_STATUS" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Suspend	"	,:l_type => "USER_STATUS" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Disabled	"	,:l_type => "USER_STATUS" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Change Name"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Change Address"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Change Status"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Change Type"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Change Position"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	5,	:line_seq =>4
		CfgLookUp.create :name => "Change Department"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	6,	:line_seq =>5
		CfgLookUp.create :name => "Change Level"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	7,	:line_seq =>6
		CfgLookUp.create :name => "Change User ID"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	8,	:line_seq =>7
		CfgLookUp.create :name => "Change Shift"		,:l_type => "EMP_HIS_TYPE" ,:int_val =>	9,	:line_seq =>8
		CfgLookUp.create :name => "Change Salary"		,:l_type => "EMP_HIS_TYPE"	 ,:int_val =>10,	:line_seq =>9
		CfgLookUp.create :name => "Create New"			,:l_type => "1" ,:int_val =>1	,:line_seq =>0
		CfgLookUp.create :name => "Change Photo"			,:l_type => "1" ,:int_val =>2	,:line_seq =>1
		CfgLookUp.create :name => "Drop Employee"			,:l_type => "1" ,:int_val =>3	,:line_seq =>2
		CfgLookUp.create :name => "Change Other"			,:l_type => "1" ,:int_val =>4	,:line_seq =>3
		CfgLookUp.create :name => "Probation	"	,:l_type => "EMP_STATUS" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Permanence	"	,:l_type => "EMP_STATUS" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Resignated	"	,:l_type => "EMP_STATUS" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Suspend	"	,:l_type => "EMP_STATUS" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Drop	"	,:l_type => "EMP_STATUS" ,:int_val =>	5,	:line_seq =>4
		CfgLookUp.create :name => "Normal Staff"		,:l_type => "EMP_TYPE" ,:int_val =>	1,	:line_seq =>0
		CfgLookUp.create :name => "Super	"	,:l_type => "EMP_TYPE" ,:int_val =>	2,	:line_seq =>1
		CfgLookUp.create :name => "Academic	"	,:l_type => "EMP_TYPE" ,:int_val =>	3,	:line_seq =>2
		CfgLookUp.create :name => "Receptionist	"	,:l_type => "EMP_TYPE" ,:int_val =>	4,	:line_seq =>3
		CfgLookUp.create :name => "Cashier	"	,:l_type => "EMP_TYPE" ,:int_val =>	5,	:line_seq =>4
		CfgLookUp.create :name => "Accountant	"	,:l_type => "EMP_TYPE" ,:int_val =>	6,	:line_seq =>5
		CfgLookUp.create :name => "HR & Admin"		,:l_type => "EMP_TYPE" ,:int_val =>	7,	:line_seq =>6
		CfgLookUp.create :name => "Other	"	,:l_type => "EMP_TYPE" ,:int_val =>	8,	:line_seq =>7

  end

  def down
  	drop_table :cfg_look_ups
  end
end
