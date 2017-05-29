class AccPlanMastersController < ApplicationController::UtilController
	@@common = CommonFunction.new

	def index
		begin
			model = AccPlanMaster.joins("left join acd_batches on acc_plan_masters.acd_batche_id=acd_batches.id").where( is_del: false )
			data = model.select(" acc_plan_masters.* , acd_batches.name as batch_name ")

			if !params[:type].nil?  # in case tc store request
				data = data.where(" acc_plan_masters.is_tc = true ")
				if !params[:text].nil?
					text = "'%#{params[:text]}%'"
					data = data.where(" acc_plan_masters.plan_master_name like #{text} ")
				end
			else
				data = data.where(" acc_plan_masters.is_tc = false or acc_plan_masters.is_tc is null  ")

			end

			render @@common.returnJoinPaginate( model, data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}	
		end
	end

	def combo
		begin			
			data = AccPlanMaster.joins(:acc_fee_plan)
			result =  data.select("acc_plan_masters.*")
			render @@common.returnJoinPaginate(data , result , params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end

	end


	def getExchangeRate
		begin
			data = 	AccPlanMaster.find_by is_del: false,is_active: 1
			if data.nil?
				render  :json => {:success => false}
			else
				render  :json => { :exchageRate => data.khr_rate  , :success => true , :total => data }
			end
			
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end
	end

	def create
		begin
			AccPlanMaster.transaction do 
				@data = AccPlanMaster.new(permit_data)
				@data.is_del =false
				@data.is_active= false

				if @data.is_tc.nil?
					@data.is_tc=false
				end

				@data.campus_id = session[:campus_id]

			    if @data.save
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccPlanMaster',"create new AccPlanMaster =   #{@data.plan_master_name}","#{params}");
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
	def deactive
		begin
			id = params[:id]

			@data = AccPlanMaster.find(id)
			@data.update_attributes(is_active:false)

			render json:{ success:true , data:@data }

		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message }
		end
	end
	def active

		begin
			id = params[:id]
			@data = AccPlanMaster.find(id)

			# check exist active . this plan can not active 2 plan in the same time because it  must disable old  plan
			if AccPlanMastersHelper.check_active_exist(id , session[:campus_id]) == true
					if @data.is_tc == true
						@data = AccPlanMaster.find_by id:id, is_active:true , campus_id:session[:campus_id] , fiscal_year:@data.fiscal_year
			        else
						@data = AccPlanMaster.find_by id:id,is_active:true , campus_id:session[:campus_id] , fiscal_year:@data.fiscal_year , acd_batche_id:@data.acd_batche_id
			        end
				render json:{ success:false , message:"Plan : #{@data.plan_master_name} is actived, Please Deactive old plan first. " }
			else
				@data.update_attributes( is_active:true )
				render json:{ success:true , data:@data }
			end
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message }
		end

	end


	def update
		begin
			AccPlanMaster.transaction do 

				@data = AccPlanMaster.find((params[:id]))
				@data.update_attributes(permit_data)

				if  @data.valid?
						auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccPlanMaster',"udpate AccPlanMaster =   #{@data.plan_master_name}"," #{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors }
				end
			end
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message }
		end
	end

	def destroy
		begin
			AccPlanMaster.transaction do 
				@data = AccPlanMaster.find((params[:id]))
				@data.update_attributes(:is_del => true)

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccPlanMaster','delete AccPlanMaster =   #{@data.plan_master_name} ',"#{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors }
				end
			end
		rescue Exception => e
			puts e.backtrace			
			render json:{ success:false , message:e.message }
		end


	end


	private
	def permit_data
		params.require(:data).permit(
					:id,
					:plan_master_name,
					:acd_batche_id,
					:fiscal_year,
					:effective_date,
					:expired_date,
					:khr_rate,
					:description,
					:campus_id,
					:is_active,
					:is_tc,
					:is_del
					)
	end
end
