class AccTcFeePlanController < ApplicationController

    def index
        begin
            if !params[:acc_plan_master_id].nil?

                data =  AccTcFeePlan.joins(:acd_degree , :acd_course_faculty).where acc_plan_master_id:params[:acc_plan_master_id]
                if !params[:text].nil?

                    text = "'%#{params[:text]}%'"
                   data =  data.where(" acc_tc_fee_plans.plan_name like #{text} ")
                end
                result = data.select("acc_tc_fee_plans.* , acd_degrees.name degree_name , acd_course_faculties.name course_name")
                render $util.returnJoinPaginate(  data, result , params[:page],params[:limit])
            else

                render json:{ data:[]  ,success:true }
            end            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end

    end

    def create
        begin

            @data = AccTcFeePlan.new(permit_data)
            @data.is_deleted=false
            if AccTcFeePlanHelper.check_exist_code(@data) == true
                render json:{ success:false  , message:" Code: #{@data.plan_code} is already exist"}
            else
                if @data.save
                    auditrail =AuditialController.new;
                    auditrail.create( session[:user_id] , 'Create', 'AccTcFeePlan',"create new AccTcFeePlan =   #{@data.plan_name}","#{params}");
                    render $util.returnSave(@data)
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
            
            @data = AccTcFeePlan.find((params[:id]))
            @data.update_attributes(permit_data)

            if  @data.valid?
                auditrail =AuditialController.new;
                auditrail.create( session[:user_id] , 'Update', 'AccTcFeePlan',"udpate AccTcFeePlan =   #{@data.plan_name}"," #{params}");
                render :json => { :data =>  @data , :success => 'true' , :total => 1}
            else
                render json: { success: false, errors:  @data.errors }
            end
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message}
        end
    end

    def destroy
        begin
            
            @data = AccTcFeePlan.find((params[:id]))
            @data.destroy()

            if  @data.valid?
                auditrail =AuditialController.new;
                auditrail.create( session[:user_id] , 'Delete', 'AccTcFeePlan','delete AccTcFeePlan =   #{@data.plan_name} ',"#{params}");
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
            :acc_plan_master_id,
            :plan_code,
            :plan_name,
            :is_full_time,
            :degree_id,
            :course_id,
            :term_one_fee,
            :term_two_fee,
            :term_three_fee,
            :term_four_fee,
            :is_active,
            :is_deleted
            )
    end
end
