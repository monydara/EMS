class SdnSuspendTypesController < ApplicationController
  def index
    data = SdnSuspendType.where(is_deleted:false).order('code')
    render json: { data: data , success: true}
  end

  def create

    if !SdnSuspendType.exists?(code: params[:data][:code],is_deleted:false)

      @data = SdnSuspendType.new(permit_data)
      @data.is_deleted =false
      if @data.save
        auditrail =AuditialController.new;
        auditrail.create( session[:user_id] , 'Create', 'SdnSuspendType',"create new suspend type =   #{@data.name}","#{params}");
        render $util.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors, message:'Failure to create suspend reason type.' }
      end

    else
      render json: { success: false, message: 'Suspend type code already exists.'}
    end


  end

  def update

    @drop_type=SdnSuspendType.find_by code:params[:data][:code],is_deleted:false

    if !@drop_type.nil?
      puts @drop_type.id
      puts params[:id]

      if @drop_type.id!=params[:id].to_i
        render json: { success: false, message: 'Suspend code is exists with other record.' }
        return;
      end
    end

    @data = SdnSuspendType.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'SdnSuspendType',"Update suspend type =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors }
    end

  end

  def destroy
    @data = SdnSuspendType.find((params[:id]))
    @data.update_attributes(:is_deleted => true)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Delete', 'SdnSuspendType','delete drop type =   #{@data.name} ',"#{params}");
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
