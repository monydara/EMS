class CfgClassRoomsController < ApplicationController::UtilController
	def index
		search = "%%" 
		if !params[:search].nil?
			search ="%#{params[:search]}%" 
		end

		data = 	AcdClassRoom.joins(:gen_campus).select(" acd_class_rooms.* , gen_campus.campus_name").where( "acd_class_rooms.name like ? and acd_class_rooms.is_deleted = 0" , search )	
		
		render $util.returnJoinPaginate( AcdClassRoom, data, params[:page],params[:limit])
	end

	def combo
		data = AcdClassRoom.where(is_deleted:false)
		render json:{ data:data , success:true }
	end

	def create
    if !AcdClassRoom.exists?(code: params[:data][:code],is_deleted:false)
      @data = AcdClassRoom.new(permit_data)
      @data.campus_id=session[:campus_id]
      @data.is_deleted =false
      if @data.save
        auditrail =AuditialController.new;
        auditrail.create(session[:user_id] , 'Create', 'AcdClassRoom',"create new room name=   #{@data.name}","#{params}");
        render $util.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors, message:'Failure to create room.' }
      end
    else
      render json: { success: false, message: 'Room code already exists.'}
    end

	end

	def update
    @room=AcdClassRoom.find_by code: params[:data][:code], is_deleted:false
    if !@room.nil?
      puts @room.id
      puts params[:id]
      if @room.id!=params[:id].to_i
        render json: { success: false, message: 'Room code is exists with other record.' }
        return;
      end
    end

    @data = AcdClassRoom.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'AcdClassRoom',"Update room type =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors }
    end

	end

	def destroy
		@data = AcdClassRoom.find((params[:id]))
		@data.update_attributes(:is_deleted => true)
    if  @data.valid?
        auditrail =AuditialController.new;
    auditrail.create( session[:user_id] , 'Delete', 'AcdClassRoom','delete class room =   #{@data.name} ',"#{params}");
        render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
    render json: { success: false, errors:  @data.errors }
    end

	end


	private
	def permit_data
		params.require(:data).permit(
							:id,
							:code,
							:name,
							:description,
							:max_seat,
							:khr_name,
							:campus_id,
							:is_deleted
					)		
	end
end
