class AccFeePlansController < ApplicationController::UtilController

	@@common = CommonFunction.new
	def index
		begin			
			@data = AccFeePlan.where(
					:is_delleted => false,
					:plan_cat_id => params[:plan_cat_id],
					:campus_id => session[:campus_id]
				).joins(:acd_degree,:acd_course_faculty)
			# condition 
			batch_id = params[:batch_id]
			tuition_time_id = params[:tuition_time_id]

			if !tuition_time_id.nil?
				@data = @data.where tuition_time_id:tuition_time_id
			end

			if !batch_id.nil?
				@data = @data.where batch_id:batch_id
			end


			@result = @data.select("
					acc_fee_plans.*,
					acd_degrees.name as degree_name,
					acd_course_faculties.name as course_name
				")
			render  :json => { :data =>  @result , :success => 'true'  }
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def plan_list
		begin
			helper = AccFeePlansHelper
			obj_return = helper.get_plan_list params, session[:campus_id] , @@common
			if obj_return == false
				render json:{ success:false ,message:helper.get_message }
			else
				render json:obj_return
			end
		rescue Exception => e
			puts e.backtrace
			render json:{ success:false , message:e.message}
		end

	end

	def show
		begin
			data = 	AccFeePlan.where(:is_del => false, :acc_plan_master_id => params[:acc_plan_master_id],:campus_id => session[:campus_id])
			render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace
			render json:{ success:false , message:e.message}
		end
	end

	def combo
		begin			
			data = []

			if !params[:batch_id].nil? && !params[:degree_id].nil? && !params[:course_id].nil?
				puts '-------------------------------------'
					data = AccFeePlan.joins(:acc_plan_master).where(
						acc_plan_masters:{ is_active:true , is_del:false},
						acd_batche_id:params[:batch_id] ,
						 acd_degree_id:params[:degree_id] ,
						 acd_course_facultie_id:params[:course_id] ,
						  is_del:false ,
						  campus_id:session[:campus_id] ,
						   is_active:true)
				else 
					data = AccFeePlan.all 
			end
			render json:{ data:data , success:true}
		rescue Exception => e
			puts e.backtrace
			render json:{ success:false , message:e.message}
		end

	end

	def create
		begin
			AccFeePlan.transaction do 
				@data = AccFeePlan.new(permit_data)
				@data.is_delleted =false				
				@data.user_id = session[:user_id]
				@data.campus_id = session[:campus_id]
			    if @data.valid?
			    	@data.save
					copy_id = params[:data]["copy_id"]
					
					if !copy_id.nil? and copy_id.to_i > 0 
						master_id = @data.id 
						@data_master = AccFeePlan.find copy_id 
						@data_master.acc_fee_plan_detail.each do |d| 
							new_record = d.dup
							new_record.plan_id= master_id
							new_record.save
						end


					end

			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccFeePlan',"create new AccFeePlan =   #{@data.plan_name}","#{params}");
			    	render json:{ data:@data , success:true}
				else
					render json: { success: false, errors: @data.errors.full_messages.first }
				end
			end

		rescue Exception => e
			puts e.backtrace
			render json:{ success:false, message:e.message }
		end
	end

	def copy
		begin
			AccFeePlan.transaction do

					new_acc_plan_master_id = params[:new_acc_plan_master_id]
			    acc_plan_master_id = params[:acc_plan_master_id]
					qeuryDetial = " insert into acc_fee_plans SELECT
												    NULL id,
												    #{new_acc_plan_master_id} acc_plan_master_id,
												    plan_code,
												    plan_name,
												    acd_degree_id,
												    acd_course_facultie_id ,
												    full_fee ,
												    monthly_fee ,
												    quarterly_fee ,
												    semesterly_fee ,
												    yearly_fee ,
												    campus_id ,
												    is_active ,
												    is_del ,
												    curdate() 'created_at',
												    curdate() 'update_at'

												from acc_fee_plans
												where acc_plan_master_id = #{acc_plan_master_id}" ;

					#puts query
					 AccFeePlan.connection.execute(qeuryDetial,:skip_logging)

						auditrail =AuditialController.new;
						auditrail.create( session[:user_id] , 'insert', 'AccFeePlan',"insert copy AccFeePlan from master id=#{acc_plan_master_id} to id=#{new_acc_plan_master_id}"," #{params}");
	        	render :json => {  :success => 'true' , :total => 1}
			end
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end
	end

	def update
		begin
			AccFeePlan.transaction do 
				@data = AccFeePlan.find((params[:id]))
				@new_record = AccFeePlan.new(permit_data)
				@new_record.id = @data.id
				@data.update_attributes(permit_data)

		      	if @data.valid?
		      		auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccFeePlan',"udpate AccFeePlan =   #{@data.plan_name}"," #{params}");
		        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
		        else
		        	render json:{ success:false , message:@data.errors.full_messages.first}
			    end
			end
		rescue Exception => e
				
			render json:{ success:false , message:e.message}
		end
		
	end

	def destroy
		begin
			AccFeePlan.transaction do 
				@data = AccFeePlan.find((params[:id]))
				@data.update_attributes(:is_del => true)

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccFeePlan','delete AccFeePlan =   #{@data.plan_name} ',"#{params}");
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


	private
	def permit_data
		params.require(:data).permit(
				:plan_cat_id,
				:batch_id,
				:tuition_time_id,
				:plan_code,
				:plan_name,
				:degree_id,
				:course_id,
				:description,
				:is_active,
				:is_delleted,
				:plan_type
			)
	end
end
