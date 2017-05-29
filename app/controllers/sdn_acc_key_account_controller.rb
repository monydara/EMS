class SdnAccKeyAccountController < ApplicationController

  def index
    data = SdnAccKeyAccount.where(campus_id:session[:campus_id],is_deleted:false)
    render json:{ data:data , success:true}
  end

	def combo
		data = SdnAccKeyAccount.where(campus_id:session[:campus_id])
		render json:{ data:data , success:true}
  end

  def create
    if !SdnAccKeyAccount.exists?(code: params[:data][:code],is_deleted:false)
      @data = SdnAccKeyAccount.new(permit_data)
      @data.is_deleted =false
      @data.campus_id =session[:campus_id]

      if @data.save
        auditrail = AuditialController.new;
        auditrail.create( session[:user_id] , 'Create', 'SdnAccKeyAccount',"create new key account =   #{@data.name}","#{params}");
        render $util.returnSave(@data)
      else
        render json: { success: false, errors:  @data.errors, message:'Failure to create key account.' }
      end
    else
        render json: { success: false, message: 'Key account code already exists.'}
    end
  end

  def update
    @key_account=SdnAccKeyAccount.find_by code: params[:data][:code], is_deleted:false

    if !@key_account.nil?
      puts @key_account.id
      puts params[:id]
      if @key_account.id!=params[:id].to_i
        render json: { success: false, message: 'Key account code is exists with other record.' }
        return;
      end
    end
    @data = SdnAccKeyAccount.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'SdnAccKeyAccount',"update key account =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors }
    end

  end

  def destroy
    @data = SdnAccKeyAccount.find((params[:id]))
    @data.update_attributes(:is_deleted => true)
    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Delete', 'SdnAccKeyAccount','Delete key account =   #{@data.name} ',"#{params}");
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
        :refer_type,
    )
  end

end
