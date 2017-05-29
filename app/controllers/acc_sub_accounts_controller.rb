class AccSubAccountsController < ApplicationController

    def index
        begin
            helper = AccSubAccountsHelper
            data =helper.get_data params
            render json:{data:data }            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end
    end
    def create
        begin
            data = AccSubAccount.new(permit_data)
            data.status ="A"
            data.start_date = Date.today
            data.is_deleted = false
            data.user_id = session[:user_id]
            data.save
            render json:{ success:true , data:data }
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end
    end
    def destroy

    end

    private
    def permit_data
        params.require(:data).permit(
            :id,
            :student_account_id,
            :tuition_time,
            :cycle_type_id,
            :term_id,
            :cycle_fee,
            :plan_type,
            :plan_id,
            :batch_id ,
            :start_date,
            :end_date


        )
    end
end
