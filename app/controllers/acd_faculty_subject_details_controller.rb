class AcdFacultySubjectDetailsController < ApplicationController
	def index
		begin

			data = AcdFacultySubjectDetailsHelper.get_data params,session[:campus_id] 
			render json:{ data:data , success:true }
		rescue Exception => e
			puts e.message
			render json:{success:false , message:"Error: Please Contact to admin " }
		end
	end

	def update
		begin
			data = AcdFacultySubjectDetail.find(params[:id])
			data = data.update_attributes(permit_data)
			
			render json:{ success:true , data:data }
		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:"Error: Please contact to admin"}
		end
	end

	def create
		begin
			data = AcdFacultySubjectDetail.new(permit_data)
			data.is_deleted = false 
			data.campus_id = session[:campus_id]
			data.save 
			render json:{ success:true , data:data }
		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:"Error: Please contact to admin"}
		end
		
	end
	def destroy
		begin
			data = AcdFacultySubjectDetail.find(params[:id])
			data = data.update_attributes(is_deleted:true )
			
			render json:{ success:true , data:data }
		rescue Exception => e
			puts e.message 
			render json:{ success:false , message:"Error: Please contact to admin"}
		end
	end
	private 
	def permit_data 
		params.require(:data).permit(
				:id,
				:division_id,
				:standard_id,
				:course_id,
				:degree_id,
				:subject_id,
				:total_credits,
				:sessions_per_week,
				:total_sessions,
				:durations_per_session,
				:total_durations,
				:description,
				:is_deleted,
				:campus_id,
				:created_at		
			)		
	end
end
