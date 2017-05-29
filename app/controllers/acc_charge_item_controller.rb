class AccChargeItemController < ApplicationController
	def combo
		begin
			data = AccChargeItem.where(is_del:false, campus_id:session[:campus_id])
			render json:{ data:data , success:true}
			
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }			
		end
	end
end
