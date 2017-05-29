class AccChargeItemsController < ApplicationController::UtilController

	@@common = CommonFunction.new
	def index
		begin
			condition = ''
			if !params[:text].nil?
				text = '%'+params[:text]+'%'
				condition += " acc_charge_items.item_code LIKE '#{text}'
								OR acc_charge_items.item_name LIKE '#{text}'
								OR acc_charge_items.charge_amount LIKE '#{text}'
								OR acc_charge_items.note LIKE '#{text}'
								OR acc_charge_items.status LIKE '#{text}'
								OR acc_charge_item_types.item_type_name LIKE '#{text}'
								
							" 
			end

			data = 	AccChargeItem.where( is_del: false )
								.joins("LEFT JOIN acc_charge_item_types 
											ON acc_charge_item_types.id=acc_charge_items.item_type_id")
			data = data.where(condition)
			result = data.select("acc_charge_items.*,acc_charge_item_types.item_type_name")
			render @@common.returnJoinPaginate(data, result,params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def create
		begin
			AccChargeItem.transaction do 
				data = params[:data]
				@data = AccChargeItem.new(permit_data)	  
				@data.is_del =false	
				@data.campus_id =session[:campus_id]
				# @data.is_editable = data["is_editable"]

			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccChargeItem',"create new ChargeItem =   #{@data.item_name}","#{params}");
			    	render $util.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end	
		
	end


	def update
		begin
			AccChargeItem.transaction do 
				@data = AccChargeItem.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccChargeItem',"udpate ChargeItem =   #{@data.item_name}"," #{params}");
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
			AccChargeItem.transaction do 
				@data = AccChargeItem.find((params[:id]))
				@data.update_attributes(:is_del => true)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccChargeItem','delete ChargeItem =   #{@data.item_name} ',"#{params}");
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


# additional function 
	def get_all

		data = AccChargeItem.where(is_del:false) 

		render json:{ data: data , success:true}
	end
	

	private
	def permit_data
		params.require(:data).permit(
					:id,
			        :item_code,
			        :item_name,
			        :item_type_id,
			        :item_type,
			        :charge_amount,
			        :note,
			        :campus_id,
			        :is_del,
			        :is_editable,
			        :status
					)		
	end
end
