class AcdClassGroupController < ApplicationController::UtilController


	def index
		begin			
		    data =  AcdClassGroup.all
		    if !params[:search].nil?
		      search = "%#{params[:search]}%" 
		      data = AcdClassGroup.where( "name like '#{search}' " ) 
		    end
		    render $util.returnPaginate(  data, params[:page],params[:limit])
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end

	end

	def create
		begin
			AcdClassGroup.transaction do 

			    @data = AcdClassGroup.new(permit_data)   

				if @data.save     
					auditrail =AuditialController.new
					auditrail.create(session[:user_id] , 'Create', 'AcdClassGroup',"create new name =   #{@data.name}","#{params[:data]}")
					render $util.returnSave(@data)
				else
					render json: { success: false, errors:  @data.errors } 
				end
			end 
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end


	end


	def update
		begin
			AcdClassGroup.transaction do 
				@data = AcdClassGroup.find((params[:id]))
				@data.update_attributes(permit_data)     

				if  @data.valid?
					auditrail =AuditialController.new;
					auditrail.create( session[:user_id] , 'Update', 'AcdClassGroup',"udpate name =   #{@data.name}"," #{params[:data]}");
					render :json => { :data =>  @data , :success => 'true' , :total => 1}
				else
					render json: { success: false, errors:  @data.errors } 
				end 

			end 
		rescue Exception => e
			puts e.backtrace 
            render json:{ success:false , message:e.message}
		end

	end

	  def destroy
	  	begin
		    @data = AcdClassGroup.find((params[:id]))
		    @data.update_attributes(:is_deleted => true)      

			if  @data.valid?
				auditrail =AuditialController.new;
				auditrail.create( session[:user_id] , 'Delete', 'AcdClassGroup','delete name =   #{@data.name} ',"#{params[:data]}");
				render :json => { :data =>  @data , :success => 'true' , :total => 1}
			else
				render json: { success: false, errors:  @data.errors } 
			end 
	  		
	  	rescue Exception => e
	  		puts e.backtrace 
            render json:{ success:false , message:e.message}
	  	end

	  end


	  private
	  def permit_data
	    params.require(:data).permit(
						:id,
						:code,
						:name,
						:value
	          )   
	  end

end
