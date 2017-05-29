class AccDiscountItemDetailsController < ApplicationController::UtilController
	def index
		begin
			data = 	AccDiscountItemDetail.where( is_del: false,acc_discount_item_id: params[:id])	
			render $util.returnPaginate(  data, params[:page],params[:limit])		
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def combo
		begin
			@data = []
			if !params[:id].nil?
				@data = AccDiscountItemDetail.where(is_del:false , acc_discount_item_id:params[:id])
			end


			render json:{ data:@data , success:true }
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
		
	end

	def index_by_discount_id
		begin
			data = 	AccDiscountItemDetail.where( is_del: false,acc_discount_item_id: params[:id])
			render :json => { :data =>  data , :success => 'true' , :total => data }
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }
		end
	end

	def create
		begin		
			AccDiscountItemDetail.transaction do 	
				@data = AccDiscountItemDetail.new(permit_data)	  
				@data.is_del =false


			    if @data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccDiscountItemDetail',"create new AccDiscountItemDetail =   #{@data.discount_amount}","#{params}");
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
			AccDiscountItemDetail.transaction do 
				@data = AccDiscountItemDetail.find((params[:id]))
				@data.update_attributes(permit_data)    
				
				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccDiscountItemDetail',"udpate AccDiscountItemDetail =   #{@data.discount_amount}"," #{params}");
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
			AccDiscountItemDetail.transaction do 		
				@data = AccDiscountItemDetail.find((params[:id]))
				@data.update_attributes(:is_del => true)	    
				if  @data.valid?
						auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccDiscountItemDetail','delete AccDiscountItemDetail =   #{@data.discount_amount} ',"#{params}");
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
					:discount_amount,
					:discount_p,
					:is_allow_edit,					
					:note,
					:is_del
					)		
	end
end
