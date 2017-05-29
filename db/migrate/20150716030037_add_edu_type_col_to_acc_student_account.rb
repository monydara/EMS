class AddEduTypeColToAccStudentAccount < ActiveRecord::Migration
  def up
    add_column :acc_student_accounts,:edu_type,:string,limit:2 #TC=Training Center, WU=Western University
  end
  def down
    remove_column :acc_student_accounts,:edu_type
  end
end
