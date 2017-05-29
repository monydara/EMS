class SdnDropTypesController < ApplicationController
  def index
    data = SdnDropType.where(is_deleted:false).order('code')
    render json: { data: data , success: true}
  end


  def create
    if !SdnDropType.exists?(code: params[:data][:code],is_deleted:false)
      @data = SdnDropType.new(permit_data)
      @data.is_deleted =false
      if @data.save
        auditrail =AuditialController.new;
        auditrail.create( session[:user_id] , 'Create', 'SdnDropType',"create new drop type =   #{@data.name}","#{params}");
        render $util.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors, message:'Failure to create drop reason type.' }
      end

    else
        render json: { success: false, message: 'Drop code already exists.'}
    end
  end

  def update

    @drop_type=SdnDropType.find_by code: params[:data][:code], is_deleted:false

    if !@drop_type.nil?
      puts @drop_type.id
      puts params[:id]

      if @drop_type.id!=params[:id].to_i
        render json: { success: false, message: 'Drop code is exists with other record.' }
        return;
      end
    end

    @data = SdnDropType.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'SdnDropType',"udpate drop type =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors }
    end

  end

  def destroy
    @data = SdnDropType.find((params[:id]))
    @data.update_attributes(:is_deleted => true)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Delete', 'SdnDropType','delete drop type =   #{@data.name} ',"#{params}");
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
        :description
    )
  end

end
