class AccPrePaymentController < ApplicationController

  @@common =CommonFunction.new

    def index
        begin            
            condition="acc_pre_payments.campus_id=#{session['campus_id']}"
            data = AccPrePayment.joins(
                   "join sdn_leads l on l.id=acc_pre_payments.lead_id
                   join acd_course_faculties c on l.course_id=c.id
                   join acd_degrees d on l.degree_id=d.id",
                  :acc_finance_tran,
                  :sys_user
            )
            if !params[:text].nil? or ! params[:text]=''
              condition +=" and (acc_finance_trans.receipt_no like '%#{params[:text]}%'
                                  or concat(l.first_name,' ',l.last_name) like '%#{params[:text]}%'
                                  or c.name like '%#{params[:text]}%' or d.name like '%#{params[:text]}%'
                                  or acc_pre_payments.currency like '%#{params[:text]}%'
                                  or sys_users.user_name like '%#{params[:text]}%'
                                  )
                                "
            end
            result=data.select("acc_pre_payments.*,acc_finance_trans.receipt_no,sys_users.user_name,concat(l.first_name,' ',l.last_name) as name,c.name as course_name,d.name as degree_name ").where(condition).order(id: :desc)
            render @@common.returnJoinPaginate(  data, result, params[:page],params[:limit])
        rescue Exception => e
            puts e.backtrace            
            render json:{ success:false , message:e.message }
        end
  end

  def rollback
    begin

        pay_id=params[:id]
        helper=AccPrePaymentHelper
        if helper.rollback_deposit(pay_id,session[:user_id])==false
            render json:{ success:false , message:helper.get_message }
        else
            render json:{ data:nil , success:true , message:'transaction has been rollback'}
        end

    rescue Exception =>e
        puts e.backtrace            
        render json:{success:false , message:e.message }
    end

  end

end
