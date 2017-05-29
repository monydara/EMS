class AccFeeCataloguesController < ApplicationController
	def index
		begin
			data = 	AccFeeCatalogue.where( is_deleted: false , campus_id:session[:campus_id])
			text = params[:text]
			if !text.nil? && !text.empty?
				data = data.where "catalogue_name like '%#{text}%' or fiscal_year like '%#{text}%' "
						
			end	
			render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }			
		end
	end


	def create
		begin
      puts '---------------- Create New Fee Cataloque --------------'

			AccFeeCatalogue.transaction do 
				@data = AccFeeCatalogue.new(permit_data)	  
				@data.is_deleted =0
				@data.campus_id = session[:campus_id]
				@data.user_id = session[:user_id]

			    if @data.valid? 
			    	@data.save	    
			    	auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Create', 'AccFeeCatalogue',"create new Catalogue =   #{@data.catalogue_name}","#{params}");
			    	render $util.returnSave(@data)
				else
					render json: { success: false, message:  @data.errors.full_messages } 
				end
      end
      puts '---------------- End New Fee Cataloque --------------'
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }	
		end
		
	end


	def update
		begin

			AccFeeCatalogue.transaction do 
				@data = AccFeeCatalogue.find((params[:id]))
				@data.update_attributes(permit_data)	    

				if  @data.valid?
					@data.save
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AccFeeCatalogue',"udpate Catalogue =   #{@data.catalogue_name}"," #{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, message:  @data.errors.full_messages } 
				end	
			end
			
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }	
		end

	end

	def destroy
		begin
			AccFeeCatalogue.transaction	 do 
				@data = AccFeeCatalogue.find((params[:id]))
				@data.update_attributes(:is_deleted => 1)	    

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Delete', 'AccFeeCatalogue','delete Catalogue =   #{@data.catalogue_name} ',"#{params}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, message:  @data.errors } 
				end	
			end
		rescue Exception => e
			puts e.backtrace        
	        render json:{ success:false , message:e.message }	
		end

	end


	private
	def permit_data
		params.require(:data).permit(
			:catalogue_name,
			:fiscal_year,
			:effective_date,
			:expired_date,
			:description,
			:is_active,
			:is_deleted
		)		
	end

end
