class Auditrial::Service
	def create(user_id , modules, description, data_detail , table_name , reference_id )
		
		@data = Auditrial.new(
			:user_id => user_id ,
			 :ad_type => "Create" ,
			  :module => modules , 
			  :description => description ,
			  :data_detail => data_detail, 
			  :table_name => table_name, 
			  :reference_id => reference_id)	  
	    @data.save	      
		
	end

	def update(user_id , modules, description, data_detail , table_name , reference_id )
		@data = Auditrial.new(
			:user_id => user_id ,
			 :ad_type => "Update" ,
			  :module => modules , 
			  :description => description ,
			  :data_detail => data_detail, 
			  :table_name => table_name, 
			  :reference_id => reference_id)	  
	    @data.save
	end 

	def destroy(user_id , modules, description, data_detail , table_name , reference_id )
		@data = Auditrial.new(
			:user_id => user_id ,
			 :ad_type => "Destory" ,
			  :module => modules , 
			  :description => description ,
			  :data_detail => data_detail, 
			  :table_name => table_name, 
			  :reference_id => reference_id)	  
	    @data.save
	end
	
end