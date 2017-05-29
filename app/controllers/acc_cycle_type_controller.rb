class AccCycleTypeController < ApplicationController
	def index
		
	end
	def combo
		render json:{data:AccCycleType.all , success:true}
	end
end
