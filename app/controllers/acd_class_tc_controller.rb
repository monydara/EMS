class AcdClassTcController < ApplicationController
	@@common = CommonFunction.new

	def index
		begin
			text = "%%"
			if !params[:text].nil?
				text = "%"+params[:text]+"%"
			end

			data = 	AcdClassTc.joins(
				:cfg_academic_year,
				:acd_term,
				:acd_class_shift,
				:acd_class_room,
				).where(
					"acd_class_tcs.campus_id = #{session[:campus_id] }
						and
						( acd_class_tcs.class_name like '#{text}' or
						  acd_class_tcs.class_code like '#{text}'
						)
				    "
				).select("
					acd_class_tcs.* ,
					acd_class_shifts.name 'shift_name',
					acd_class_rooms.name 'class_room',
					acd_terms.term_name 'term',
			        cfg_academic_years.name 'academic_year'

				 ")
			render @@common.returnJoinPaginate(  AcdClassTc, data, params[:page],params[:limit])
			
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end
	end
	def get_class_by_id
		begin
			data =  [] 
			if !params[:id].nil? && !params[:id].empty?
				
				@c = AcdClassTc.find(params[:id])
				data = AcdClassTcHelper.get_class(@c.class_code)
			end
			render json:{ data:data , success:true }
			
		rescue Exception => e
			puts e.backtrace 
			render json:{ success:false , message:'Erro: Please Contact Admin'}
		end
	end

	def create
		begin
			AcdClassTc.transaction do 
				@data = AcdClassTc.new(permit_data)
				@data.campus_id =session[:campus_id]

			    if @data.save
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AcdClassTc',"create new name =   #{@data.class_name}","#{params}");
			    	render @@common.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors }
				end

			end 
				
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end

	end


	def update
		begin
			AcdClassTc.transaction do 
				@data = AcdClassTc.find((params[:id]))
				@data.update_attributes(permit_data)

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AcdClassTc',"udpate name =   #{@data.class_name}"," #{params[:data]}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors }
				end

			end
			
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end

	end

	def destroy
		begin
			AcdClassTc.transaction do 
				@data = AcdClassTc.find((params[:id]))
				@data.update_attributes(:is_deleted => true)

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AcdClassTc','delete name =   #{@data.class_name} ',"#{params[:data]}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors }
				end

			end
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end


	end

	def get_class
		begin
			class_code = params[:class_code]
			result = AcdClassTcHelper.get_class(class_code)
			render json:{ success:true , data:result }
		rescue Exception => e
			render json:{ success:false , message:e.message}
		end
	end

# additional function
	def getTcDetail
		begin
			data = []
			if !params[:id].nil?

				data = AcdClassTc.find(params[:id]).acd_class_tc_detail

				data = data.joins(:acd_subject, :hr_employee ).select(" acd_class_tc_details.* , hr_employees.name 'lecturer', acd_subjects.name 'subject'").where(is_deleted:false)

			end
			render json:{ data:data , success:true}
			
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end

	end

	def removeSubject
		begin
			data = AcdClassTcDetail.find(params[:id])
			data.update_attributes( is_deleted:true )
			data.save
			render json:{ success:true, message:'Subject remove success'}
			
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end
	end
# -================== end
	private
	def permit_data
		params.require(:data).permit(
			:id,
			:class_code,
			:class_name,
			:degree_id,
			:course_id,
			:academic_year_id,
			:term_id,
			:room_id,
			:course_level_id,
			:tuition_time_id,
			:session_id,
			:start_date,
			:end_date,
			:study_start_time,
			:description,
			:status,
			:created_at,
			:updated_at,
			:acd_class_tc_detail_attributes => [
				:id ,
				:class_tc_id,
				:subject_id,
				:lecture_id,
				:total_session,
				:pass_score,
				:max_score,
				:is_deleted
			]
		)
	end
end
