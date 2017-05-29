class AccCashDrawersController < ApplicationController
	@@common =CommonFunction.new

	def index
		begin
			group_id = params[:group_id]

			if !group_id.nil?
				data = AccCashDrawer.joins(:sys_user).where( is_deleted: false , cdg_id:group_id ).select("acc_cash_drawers.* , sys_users.user_id , sys_users.user_name ")
				render :json =>{ :success => true , :data => data}
			else
				render :json =>{ :success => true , :data => []}
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

# ADDITION METHOD  with ajax request
	def getValidUser
		begin
			data = []	
			if !params[:group_id].nil?
				
				data = SysUser.find_by_sql(" SELECT * FROM sys_users WHERE id NOT IN
										(SELECT sys_user_id FROM acc_cash_drawers WHERE cdg_id =  #{params[:group_id]}) ")
			end 

			render :json => { :data => data , :success => true}
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end		
	end

	def addMember
		begin
			dataJson=JSON.parse(params[:acc_cash_drawer_attributes])
			for obj in dataJson	
				data = AccCashDrawer.new( :cdg_id => params[:group_id] , :sys_user_id =>obj['id'] , :is_active => true , :is_deleted => false , :create_by => session['user_id'] )
				data.save			
			end

			render :json => { :success=> true , :group_id => params[:group_id]}
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def activeMember
		begin
			if !params[:AccCashDrawerId].nil?
				data = AccCashDrawer.find(params[:AccCashDrawerId])
				data.update_attributes(is_active: true)
				render :json =>{ :success => true , :message => "Active member successful" , :data => data}
			else	
				render :json =>{ :success => false , :message => "error to active without id "}
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def deactiveMember
		begin
			if !params[:AccCashDrawerId].nil?
				data = AccCashDrawer.find(params[:AccCashDrawerId])
				data.update_attributes(is_active: false)
				render :json =>{ :success => true , :message => "Active member successful" , :data => data}
			else	
				render :json =>{ :success => false , :message => "error to active without id "}
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end		
	end

	def removeMember
		begin
			if !params[:AccCashDrawerId].nil?
				data = AccCashDrawer.find(params[:AccCashDrawerId])
				data.update_attributes(is_deleted: true)
				render :json =>{ :success => true , :message => "Active member successful" , :data => data}
			else	
				render :json =>{ :success => false , :message => "error to active without id "}
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
		
		
	end

	def activeGroupMember
		begin
			data = TestingService.new().call
			render :json => { :dataTesting => data}
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end		
	end

	

	


end
