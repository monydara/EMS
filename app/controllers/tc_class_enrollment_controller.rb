class TcClassEnrollmentController < ApplicationController
	@@common = CommonFunction.new

	def index
		begin
			helper = TcClassEnrollmentHelper
			data =helper.get_data params, @@common , session[:campus_id]
			render data
			
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end
	def create 
		begin
			data = SdnClassTcStudent.new(permit_data)
			data.campus_id = session[:campus_id]
			data.enroll_by_id = session[:user_id]
			data.is_del = false 
			data.save 

			TcClassEnrollmentHelper.udpate_class_admission data.admission_id , data.class_id 
			
			render json:{ success:true , data:data }
		rescue Exception => e
			render json:{ success:false , message:e.message }
		end
	end 

	def update 
		begin
			data = SdnClassTcStudent.find(params[:id])
			data.update_attributes(permit_data)
			render json:{ success:true , data:data}
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end

	

	def destroy
      begin

        data = AcdClassTc.find(params[:id])
        data.update_attributes(:is_deleted => true)

        render json: {data:data, success: true,message:'The record has been deleted!' }

      rescue Exception=> e
        render json: {success: false,message:e.message }

      end
    end

	def get_student_list

			helper = TcClassEnrollmentHelper

			data =helper.get_data params, @@common , session[:campus_id]


			render data
	end



	private

	def permit_data
		params.require(:data).permit(			
			:class_id,
			:student_id,
			:admission_id,
			:enroll_date,
			:is_del

		)

	end

end
