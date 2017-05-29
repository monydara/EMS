class AccFinanceTransController < ApplicationController::UtilController
	 include ActionView::Helpers::NumberHelper
	def index
		begin			
			data = 	AccFinanceTran.where user_id:session[:user_id]

			render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e		
			puts e.backtrace			
			render json:{ success:false , message:e.message}
		end
	end
	def get_total_amount
		total_amount_usd = 	AccFinanceTran.sum(:amount_usd ,:conditions => {user_id:session[:user_id],currency_code:"USD"}) 
		total_amount_khr = 	AccFinanceTran.sum(:amount_khr , :conditions => {user_id:session[:user_id],currency_code:"USD"})

		render json:{ total_amount_khr: number_to_currency(total_amount_khr) ,total_amount_usd:number_to_currency(total_amount_usd) , success:true}
	end
	def create
		begin
			AccFinanceTran.transaction do 
				@commonClass = CommonFunction.new
				@data = AccFinanceTran.new(permit_data)
				@data.receipt_no =@commonClass.getNextCode("RECEIPT",session[:campus_id])
				@data.tran_date = Date.today
				@data.user_id = session[:user_id]
		    	if @data.currency_code == "USD"

		    		@data.amount_usd =params[:data]["paid_amount"] 
		    	else
		    		@data.amount_usd =(params[:data]["paid_amount"].to_f) / (params[:data]["exchange_rate"].to_f)
		    		@data.amount_khr = params[:data]["paid_amount"]
		    	end
			    if @data.save
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccFinanceTran',"create new AccFinanceTran =   #{@data.receipt_no}","#{params}");
			    	render $util.returnSave(@data)
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
			AccFinanceTran.transaction do 
				@data = AccFinanceTran.find((params[:id]))
				@data.update_attributes(permit_data)

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccFinanceTran',"udpate AccFinanceTran =   #{@data.receipt_no}"," #{params}");
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
			AccFinanceTran.transaction do 
				@data = AccFinanceTran.find((params[:id]))
				@data.destroy()

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccFinanceTran','delete AccFinanceTran =   #{@data.receipt_no} ',"#{params}");
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
			:account_id,
			:receipt_no,
			:acc_tran_type_id,
			:acc_reason_type_id,
			:acc_cash_drawer_tran_id,
			:acc_payment_method_id,
			:ref_no,
			:tran_date,
			:currency_code,
			:amount_usd,
			:amount_khr,
			:commited_date,
			:rollback_date,
			:remark
			
		)
	end
end
