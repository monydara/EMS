class SdnDocumentTypeController < ApplicationController
	def index
		data =SdnDocumentType.all
		render json:{ data:data , success:true}
	end
end
