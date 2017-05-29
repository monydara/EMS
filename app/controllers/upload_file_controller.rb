class UploadFileController < ApplicationController

    def upload
        begin

            data = FileUpload.new(permit_data)
            data.save
            # if data.valid

                render json:{file_url:data.file.url , success:true }
            # else
            #     render json:{ success:false , message:data.errors}
            # end


        rescue Exception => e
            render json:{ success:false , message:e.message }
        end

    end

    private

    def permit_data
        params.permit(
            :file
        )

    end
end
