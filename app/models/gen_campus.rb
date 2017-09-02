class GenCampus < ActiveRecord::Base
	has_many :acd_class_rooms , :foreign_key => "campus_id"
	has_many :acd_batches
	has_many :sys_user_location
  has_many :sdn_student

=begin
--- status of Campus
1= Acitve
0= Deactive

=end

end
