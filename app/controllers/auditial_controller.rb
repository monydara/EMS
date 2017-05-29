class AuditialController < ApplicationController
	@@common = CommonFunction.new
	def index
		@data = Auditrial.where( user_id: session[:user_id])
		render @@common.returnPaginate(  @data, params[:page],params[:limit])
	end

	def create(user_id ,type, modules, description, data_detail)
		@data = Auditrial.new(
			:user_id => user_id ,
			 :ad_type => type ,
			  :module => modules , 
			  :description => description ,
			  :data_detail => data_detail)	  
	    @data.save	      
		
	end

end
