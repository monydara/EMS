class AcdTuitionTimesController < ApplicationController
	@@common = CommonFunction.new

	def index
		data = 	AcdTuitionTime
		render @@common.returnPaginate(  data, params[:page],params[:limit])
	end

	def combo
		data = 	AcdTuitionTime.all
		render json:{ data:data , success:true}
	end
	def create
		@data = AcdTuitionTime.new(permit_data)

	    if @data.save
	    	auditrail =AuditialController.new;
				auditrail.create( session[:user_id] , 'Create', 'AcdTuitionTime',"create new name =   #{@data.tuition_name}","#{params}");
	    	render @@common.returnSave(@data)
		else
			render json: { success: false, errors:  @data.errors }
		end

	end


	def update
		@data = AcdTuitionTime.find((params[:id]))
		@data.update_attributes(permit_data)

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Update', 'AcdTuitionTime',"udpate name =   #{@data.tuition_name}"," #{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors }
      end
	end

	def destroy
		@data = AcdTuitionTime.find((params[:id]))
		@data.update_attributes(:is_deleted => true)

      if  @data.valid?
      		auditrail =AuditialController.new;
			auditrail.create( session[:user_id] , 'Delete', 'AcdTuitionTime','delete name =   #{@data.tuition_name} ',"#{params[:data]}");
        	render :json => { :data =>  @data , :success => 'true' , :total => 1}
      else
			render json: { success: false, errors:  @data.errors }
      end

	end


	private
	def permit_data
		params.require(:data).permit(
			:id,
			:tuition_name,
			:tuition_hours
		)
	end
end
