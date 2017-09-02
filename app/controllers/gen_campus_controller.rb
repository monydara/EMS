class GenCampusController < ApplicationController::UtilController
  def index
    data =	GenCampus.where is_deleted: false
    render $util.returnPaginate(data, params[:page], params[:limit])
  end

  def create
    @data = GenCampus.new(permit_data)
    @data.is_deleted = false
    if @data.save
      @auditrail = AuditialController.new

      @auditrail.create(session[:user_id], 'Create', 'GenCampus', "create new name =   #{@data.campus_name}", params.to_s)
      render $util.returnSave(@data)
    else
      render json: { success: false, errors: @data.errors }
     end
  end

  def update
    @data = GenCampus.find(params[:id])
    @data.update_attributes(permit_data)

    if @data.valid?
      @auditrail = AuditialController.new
      @auditrail.create(session[:user_id], 'Update', 'GenCampus', "udpate name =   #{@data.campus_name}", " #{params}")
      render json: { data: @data, success: 'true', total: 1 }
    else
      render json: { success: false, errors: @data.errors }
    end
  end

  def destroy
    @data = GenCampus.find(params[:id])
    @data.update_attributes(is_deleted: true)

    if @data.valid?
      @auditrail = AuditialController.new
      @auditrail.create(session[:user_id], 'Delete', 'GenCampus', 'delete name =   #{@data.campus_name} ', params.to_s)
      render json: { data: @data, success: 'true', total: 1 }
    else
      render json: { success: false, errors: @data.errors }
    end
  end

  # ------- update status
  def update_status

    @campus_id = params[:campus_id]
    if !@campus_id.nil?
      @data = GenCampus.find @campus_id
      @data.update_attributes(status: params[:status] )
      @data.save
      render json: { data: @data, success: 'true', total: 1 }
    else
      render json: { success: false, errors:"can't close campus without campus id " }
    end

  end
  private

  def permit_data
    params.require(:data).permit(
      :id,
      :campus_code,
      :campus_name,
      :abbr,
      :address,
      :email,
      :phone,
      :director,
      :start_date,
      :is_deleted,
      :status
    )
  end
end
