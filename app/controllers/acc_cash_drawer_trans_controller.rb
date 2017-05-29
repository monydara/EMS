class AccCashDrawerTransController < ApplicationController::UtilController


	def index
		
		begin
			sql = " SELECT  cdt.*,u.user_name,o.user_name as open_by_name,c.user_name as closed_by_name
			FROM acc_cash_drawer_trans as cdt
			INNER JOIN acc_cash_drawers as cd ON cdt.acc_cash_drawer_id=cd.id
			INNER JOIN sys_users as u ON cd.sys_user_id=u.id
			INNER JOIN sys_users as o ON cdt.open_by=o.id
			LEFT JOIN sys_users as c ON cdt.closed_by=c.id"
			where = " WHERE cdt.campus_id=#{session[:campus_id]} "

			if !params[:from_date].nil?
					where = where + " and cdt.open_date between '#{params[:from_date] }' and '#{params[:to_date]}' "
			end
			sql = sql+where+" LIMIT  #{(params[:page].to_i-1)} , 25"

			data=AccCashDrawerTran.find_by_sql(sql);
			render json:{ data:data , total:AccCashDrawerTran.where(:campus_id => session[:campus_id]).count , success:true}
		rescue Exception => e
			puts e.backtrace        
			render json: { success: false, message:e.message}
		end
					
				
	end

	def comboCashDrawer

		begin
			data=AccCashDrawer.find_by_sql("SELECT
				cd.id,CONCAT(cdg.group_name,' - ', u.`user_name`) drawer_name
			FROM acc_cash_drawers cd
			INNER JOIN sys_users u ON cd.`sys_user_id`=u.`id`
			INNER JOIN acc_cash_drawer_groups cdg ON cd.cdg_id=cdg.id
			WHERE cd.`is_active`=1 AND cd.`is_deleted`=0 AND u.`status_id`=29 and cdg.campus_id=#{session[:campus_id]}")

			render json: { data:data, success: true}
		rescue Exception => e
				puts e.backtrace        
				render json:{success: false, message:e.message}
		end

	end

	def create
		begin
			AccCashDrawerTran.transaction do
				@data = AccCashDrawerTran.new(permit_data)    
				# check exist open 
				check_data = AccCashDrawerTran.find_by acc_cash_drawer_id:@data.acc_cash_drawer_id,closed_date:nil
					# check if current date 
					if !check_data.nil?
							if check_data.open_date == Date.today
								render json:{ success:false , message:"Cash Drawer already opened."}
								return 
							else
								render json:{ success:false , message:"Please close cash drawer before start open again . "}
								return 
							end

					end

				@data.open_by = session[:user_id]
				@data.open_date=DateTime.now
				@data.campus_id = session[:campus_id]      
				if @data.save
						auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccCashDrawerTran',"create new cash drawer tran id  #{@data.acc_cash_drawer_id}","#{params}");
						render $util.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end
		rescue Exception => e
			render json:{ success:false , message:e.message }
		end
		

	end


	def update
		begin

			AccCashDrawerTran.transaction do
				@data = AccCashDrawerTran.find(params[:id])
				@data.update_attributes(permit_data)

				if @data.valid?
						render json:{ data:@data , success:true }
					else
						render json:{ data:@data , success:false , message:@data.errors }

				end
			end

		rescue Exception => e
			puts e.backtrace        
			render json:{ success:false , message:e.message }
			
		end
	end

	def destroy


	end


	private
	def permit_data
		params.require(:data).permit(
					'id',
					'acc_cash_drawer_id',
					'open_amount',
					'open_amount_khr'
					)		
	end

end
