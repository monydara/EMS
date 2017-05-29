class AddRemoveColumnsToSdnStudentKhr < ActiveRecord::Migration
  def up
    add_column :sdn_student_khrs, :diploma_num, :string, limit:50, after: :diploma_year
    remove_column :sdn_student_khrs, :first_name
    remove_column :sdn_student_khrs, :last_name
  end

  def down
    remove_column :sdn_student_khrs, :diploma_num
    add_column :sdn_student_khrs, :first_name, :string, limit:50
    add_column :sdn_student_khrs, :last_name, :string, limit:50
  end

end
