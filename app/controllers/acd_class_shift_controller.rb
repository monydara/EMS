class AcdClassShiftController < ApplicationController
	def combo
		begin
			data = AcdClassShift.all 
			render json:{ data:data, success:true}
			
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end
	end
end
