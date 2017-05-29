class SdnDocument < ActiveRecord::Base
	belongs_to :sdn_student , foreign_key:'student_id'
	belongs_to :sdn_document_type , foreign_key:'doc_type_id'
	has_attached_file :avatar

	validates_attachment_content_type :avatar, :content_type => ["application/pdf",
		"application/vnd.ms-excel" , "text/plain",
		"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
		"application/msword",
		"application/vnd.openxmlformats-officedocument.wordprocessingml.doocument",
		"image/jpg", "image/jpeg", "image/png", "image/gif" ,
		"application/zip",
		"application/x-zip",
		"application/x-zip-compressed"
	]
end
