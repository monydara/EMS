class AccTaxTypeController < ApplicationController
  def index
  	begin
	    data=AccTaxType.where(:is_deleted => false).order(:id)
	    render json: {data:data,success:true}
  		
  	rescue Exception => e
  		puts e.backtrace 
        render json:{ success:false , message:e.message }
  	end
  end
end
