class AddStatusColumnToSdnStudents < ActiveRecord::Migration
  def up
    add_column :sdn_students, :status, :string, :limit=>1, after: :note  # N=New, A=Active, D=Drop, S=Suspend, C=Cancel, F=Finished
  end

  def down
    remove_column :sdn_students, :status
  end
end
