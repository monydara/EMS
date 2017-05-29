class AcdClassWuController < ApplicationController
	@@common = CommonFunction.new

    def index
        begin            
            text = "%%"
            if !params[:text].nil?
              text = "%"+params[:text]+"%"
            end

            data =  AcdClassWu.joins(
                  :cfg_academic_year,
                  :acd_class_shift,
                  :acd_class_room
                  ).where(
                    "acd_class_wus.campus_id = #{session[:campus_id] }
                      and
                      ( acd_class_wus.class_name like '#{text}' or
                        acd_class_wus.class_code like '#{text}'
                      )
                      "
                  ).select("
                    acd_class_wus.* ,
                    acd_class_shifts.name 'session',
                    acd_class_rooms.name 'class_room'

                   ")
            render @@common.returnJoinPaginate(  AcdClassWu, data, params[:page],params[:limit])
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end

    end



    def create
        begin            
            @data = AcdClassWu.new(permit_data)
            @data.campus_id = session[:campus_id]

            if @data.save
                auditrail =AuditialController.new
                auditrail.create(session[:user_id] , 'Create', 'AcdClassWu',"create new name =   #{@data.class_name}","#{params[:data]}")
                render @@common.returnSave(@data)
            else
                render json: { success: false, errors:  @data.errors }
            end
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end

    end


    def update
        begin            
            @data = AcdClassWu.find((params[:id]))
            @data.update_attributes(permit_data)

            if  @data.valid?
              auditrail =AuditialController.new;
              auditrail.create( session[:user_id] , 'Update', 'AcdClassWu',"udpate name =   #{@data.class_name}"," #{params[:data]}");
              render :json => { :data =>  @data , :success => 'true' , :total => 1}
            else
              render json: { success: false, errors:  @data.errors }
            end
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end


    end
    def get_class_by_id
        begin
            data = [] 
            if !params[:id].nil? && !params[:id].empty?         
                @c = AcdClassWu.find(params[:id])
                data =  AcdClassWuHelper.get_class(@c.class_code)
            end
            render json:{ data:data ,success:true }
        rescue Exception => e
            puts e.message 
            render json:{ success:false , message:"Error: Please contact admin"}
        end
    end

    def get_class
        begin
            class_code = params[:class_code]
            result = AcdClassWuHelper.get_class(class_code)
            render json:{ success:true , data:result }
        rescue Exception => e
            render json:{ success:false , message:e.message}
        end
    end

    def get_wu_detail
        begin
            data = []
            if !params[:class_id].nil?
                data = AcdClassWu.find(params[:class_id])
                if !data.nil?
                    data = data.acd_class_wu_detail.joins(:acd_subject, :hr_employee , :acd_class_division ).select(" acd_class_wu_details.* , hr_employees.name 'lecturer', acd_subjects.name 'subject' , acd_class_divisions.name division ").where(is_deleted:false)
                end
            end
            render json:{ data:data , success:true}
            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end

    end
    def destroy

        begin
            @data = AcdClassWu.find((params[:id]))
            @data.update_attributes(:is_deleted => true)

            if  @data.valid?
                auditrail =AuditialController.new;
                auditrail.create( session[:user_id] , 'Delete', 'AcdClassWu','delete name =   #{@data.class_name} ',"#{params[:data]}");
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
                :class_code,
                :class_name,
                :program_type,
                :degree_id,
                :course_id,
                :standard_id,
                :division_id,
                :academic_year_id,
                :room_id,
                :class_shift_id,
                :is_gpa,
                :credit,
                :start_date,
                :end_date,
                :description,
                :status,
                # :acd_class_wu_detail_attributes => [
                #     :id,
                #     :class_wu_id,
                #     :subject_id,
                #     :lecturer_id,
                #     :division_id,
                #     :total_session,
                #     :credit,
                #     :pass_score,
                #     :max_score,
                #     :no_exam,
                #     :is_exam,
                #     :is_deleted
                # ]
          )
  end
end
