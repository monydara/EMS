class AccGroupAccountController < ApplicationController

  @@common = CommonFunction.new
  def index
    render json:{data:AccGroupAccount.all , success:true}
  end


  def create
    begin
      AccGroupAccount.transaction do
        @data = AccGroupAccount.new(permit_data)

        @data.status ='O'
        @data.campus_id = session[:campus_id]

        if @data.save
          auditrail =AuditialController.new
          auditrail.create(session[:user_id] , 'Create', 'AccGroupAccount',"create new name =   #{@data.group_name}","#{params[:data]}")
          render @@common.returnSave(@data)
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
      AccGroupAccount.transaction do
        @data = AccGroupAccount.find((params[:id]))
        @data.update_attributes(permit_data)

        if  @data.valid?
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Update', 'AccGroupAccount',"udpate name =   #{@data.group_name}"," #{params[:data]}");
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

  private
  def permit_data

    params.require(:data).permit(
        :id,
        :group_code,
        :group_name,
        :group_type,
        :account_type,
        :description,
        :status
    )

  end


end
