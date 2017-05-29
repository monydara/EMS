class SdnLeadController < ApplicationController

	 @@common = CommonFunction.new
  def index
    begin
        @service = SdnLead::Filter.new
        campus_condition = " sdn_leads.campus_id = #{session[:campus_id]} "
        condition= @service.get_condition params , campus_condition



        data =  SdnLead.where(condition).joins(:acd_class_shift , :acd_course_faculty , :acd_degree).joins(
            " left join sdn_students on sdn_students.lead_id = sdn_leads.id "
          )


        if !params[:status].nil?
            case params[:status]
            when 'R'
              data = data.where(is_canceled:false)
            when 'A'

            when 'C'
              data = data.where(is_canceled:true)

            end
        else
          data = data.where(is_canceled:false)
        end
        data = data.order(:registered_date => :asc)

        result = data.select("
          sdn_leads.* , acd_class_shifts.name class_shift , acd_course_faculties.name course , acd_degrees.name degree , sdn_students.student_no ")


        render @@common.returnJoinPaginate( data, result, params[:page],params[:limit])
    rescue Exception => e
        render json:{ success:false , message:e.message ,error:e.backtrace}
    end


  end

  def combo
    begin
        data =[]
        if !params[:type].nil? && !params[:degree_id].nil?

          data = AcdDegreeCourse.where(degree_id:params[:degree_id])
          # data = data.acd_course_faculty
        elsif !params[:type].nil?
          data = SdnLead.where(is_deleted:false,course_type:params[:type])
        end
        render json:{ data:data , success:true }
    rescue Exception => e
        render json:{ success:false , message:e.message}
    end

  end


  def create
      begin
          SdnLead.transaction do
              @data = SdnLead.new(permit_data)
              @data.campus_id = session[:campus_id]
              @data.is_canceled = false

              if @data.valid?
                @data.save
                  #   image_url =  @data.avatar.url(:thumb)

                  # @data.update_attributes(photo_path:image_url  )

                  account_no = @@common.getNextCode("ACCOUNT NO",session[:campus_id])
                  if SdnLeadHelper.insert_into_acc_student_account(@data , account_no) == false
                      render json:{ success:false , message:'Error insert into acc student account' }
                      return 0
                  end

                  auditrail =AuditialController.new
                  auditrail.create(session[:user_id] , 'Create', 'SdnLead',"create new name =   #{@data.first_name}","#{params[:data]}")
                  render @@common.returnSave(@data)
              else
                  render json: { success: false, message:@data.errors.full_messages.first }
                  raise ActiveRecord::Rollback
              end

          end
      rescue Exception => e
        puts e.message
        render json:{ message:e.message , success:false }
      end
  end


  def update
    begin
        SdnLead.transaction do
          @data = SdnLead.find((params[:id]))
          @data.update_attributes(permit_data)
          if  @data.valid?
              #   @data.save
              # @data.update_attributes(photo_path: @data.avatar.url(:thumb)  )
              auditrail =AuditialController.new;
              auditrail.create( session[:user_id] , 'Update', 'SdnLead',"udpate name =   #{@data.first_name}"," #{params[:data]}");
              render :json => { :data =>  @data , :success => 'true' , :total => 1}
          else
              render json: { success: false, errors: @data.errors.full_messages.first  }
              raise ActiveRecord::Rollback
          end
        end
    rescue Exception => e
        puts e.backtrace
        render json:{ message:e.message , success:false }
    end


  end

  def destroy
    begin
        @data = SdnLead.find((params[:id]))
        @data.update_attributes(:is_canceled => true)

        if  @data.valid?
            auditrail =AuditialController.new;
            auditrail.create( session[:user_id] , 'Delete', 'SdnLead','delete name =   #{@data.first_name} ',"#{params[:data]}");
            render :json => { :data =>  @data , :success => 'true' , :total => 1}
        else
            render json: { success: false, errors:  @data.errors }
        end
    rescue Exception => e
        puts e.backtrace
        render json:{ message:e.message , success:false }
    end

  end


  private
  def permit_data

    params.permit(
			:id,
			:title_id,
			:first_name,
			:last_name,
			:khr_first_name,
			:khr_last_name,
			:gender,
			:date_of_birth,
			:registered_date,
			:place_of_birth,
			:phone_no,
			:email,
			:address,
      :image_url ,
			:note,
			:degree_id,
			:course_id,
			:class_shift_id,
			:is_canceled,
			:campus_id,
            :avatar
          )
  end
end
