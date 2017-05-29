class AddLeadidToadmissionTable < ActiveRecord::Migration
  def up
    add_column :sdn_admissions , :lead_id , :integer ,after: :student_id
  end
end
