class FileUpload < ActiveRecord::Base
    # validates_attachment_content_type :file, :content_type => ["application/pdf",
    #     "application/vnd.ms-excel" , "text/plain",
    #     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    #     "application/msword",
    #     "application/vnd.openxmlformats-officedocument.wordprocessingml.doocument",
    #     "image/jpg", "image/jpeg", "image/png", "image/gif" ,
    #     "application/zip",
    #     "application/x-zip",
    #     "application/x-zip-compressed"
    # ]
    has_attached_file :file
    validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
