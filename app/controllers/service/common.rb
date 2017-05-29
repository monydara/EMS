class Common
	
	def returnPaginate (modelClass,page,limit)

		data = modelClass.paginate(:page => page, :per_page => limit)		
		total = modelClass.count
		
       	return  :json => { :data =>  data , :success => 'true' , :total => total }      
		
	end
	def returnJoinPaginate (modelClass,dataQeury,page,limit)

		data = dataQeury.paginate(:page => page, :per_page => limit)		
		total = modelClass.count
		
       	return  :json => { :data =>  data , :success => 'true' , :total => total }      
		
	end
	
end