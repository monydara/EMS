class SdnStatusLog < ActiveRecord::Base
  belongs_to :sdn_student , :foreign_key=> "student_id"
  belongs_to :sdn_admission , :foreign_key=> "admission_id"
  belongs_to :acd_degree , :foreign_key=> "degree_id"
  belongs_to :acd_course_faculty , :foreign_key=> "course_id"
  belongs_to :sys_user , :foreign_key=> "status_by_id"  # id of user that done the record Drop,Suspend,or Reactive
end
