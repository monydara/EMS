class AccGroupAccountsController < ApplicationController
	def combo		
		@data =AccGroupAccount.where status:"O",campus_id:session[:campus_id]
		render json:{ data:@data , success:true }
	end
end
