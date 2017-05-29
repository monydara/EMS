class SdnLead < ActiveRecord::Base

   validates_uniqueness_of :first_name , scope:[ :last_name , :date_of_birth , :degree_id , :course_id]
	belongs_to :acd_degree , :foreign_key => "degree_id"
	belongs_to :acd_course_faculty , :foreign_key => "course_id"
	belongs_to :acd_class_shift , :foreign_key => "class_shift_id"
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" } ,:default_url => "/resources/images/photo/no-picture.gif"
  	validates_attachment_content_type :avatar,:content_type => /\Aimage\/.*\Z/ # :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
