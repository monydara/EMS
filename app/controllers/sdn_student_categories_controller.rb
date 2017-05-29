class SdnStudentCategoriesController < ApplicationController

	def index
		data = SdnCategory.where(is_deleted:false).order('id')
		render json: { data: data , success: true}
  end

  def create

    if !SdnDropType.exists?(code: params[:data][:code],is_deleted:false)
        @data = SdnCategory.new(permit_data)
        @data.is_deleted =false

        if @data.save
          auditrail =AuditialController.new;
          auditrail.create( session[:user_id] , 'Create', 'SdnCategory',"create new category =   #{@data.name}","#{params}");
          render $util.returnSave(@data)
        else
          render json: { success: false, errors:  @data.errors, message:'Failure to create student category.' }
        end
    else
          render json: { success: false, message: 'category code already exists.'}
    end

  end

  def update

    @category=SdnCategory.find_by code:params[:data][:code],is_deleted:false

    if !@category.nil?

      if @category.id!=params[:id].to_i
        render json: { success: false, message: 'Drop code is exists with other record.' }
        return;
      end
    end

    @data = SdnCategory.find((params[:id]))
    @data.update_attributes(permit_data)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Update', 'SdnCategory',"Update category =   #{@data.name}"," #{params}");
      render :json => { :data =>  @data , :success => 'true' , :total => 1}
    else
      render json: { success: false, errors:  @data.errors }
    end

  end

  def destroy
    @data = SdnCategory.find((params[:id]))
    @data.update_attributes(:is_deleted => true)

    if  @data.valid?
      auditrail =AuditialController.new;
      auditrail.create( session[:user_id] , 'Delete', 'SdnCategory','delete category =   #{@data.name} ',"#{params}");
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
