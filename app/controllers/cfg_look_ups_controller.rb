class CfgLookUpsController < ApplicationController
	def index
		
		data = CfgLookUp.where(l_type:params[:type])
		render :json => { :data => data , success:true  }
	end

end
