class AccStudentAccountController < ApplicationController
    @@common =CommonFunction.new
    def index
        begin
            start  = params[:limit].to_i* (params[:page].to_i-1)
            limit = params[:limit].to_i * params[:page].to_i


            total =  AccStudentAccount.find_by_sql get_index_sql(" count(*) ")
            sql = get_index_sql(" * ") + "limit #{start},#{limit} "
            data = AccStudentAccount.find_by_sql sql

            render json:{ data:data , total:total.count , success:true}
            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end
    end

    def create
        begin    
            AccStudentAccount.transaction do 
                @data = AccStudentAccount.new(permit_data)
                if @data.save
                    auditrail =AuditialController.new;
                    auditrail.create( session[:user_id] , 'Create', 'AccStudentAccount',"create new DiscountType account no =   #{@data.account_no}","#{params}");
                    render @@common.returnSave(@data)
                else
                    render json: { success: false, errors:  @data.errors }
                end

            end        
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end

    end


    def update
        begin
            AccStudentAccount.transaction do 
                @data = AccStudentAccount.find((params[:id]))
                @data.update_attributes(permit_data)
                @data.status = "C"
                @data.save

                if  @data.valid?
                    auditrail =AuditialController.new;
                    auditrail.create( session[:user_id] , 'Update', 'AccStudentAccount',"udpate DiscountType account no =   #{@data.account_no}"," #{params}");
                    render :json => { :data =>  @data , :success => 'true' , :total => 1}
                else
                    render json: { success: false, errors:  @data.errors }
                end
            end
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end
    end

    def destroy
        begin
            @data = AccStudentAccount.find((params[:id]))
            @data.update_attributes(:is_deleted => true)

            if  @data.valid?
                auditrail =AuditialController.new;
                auditrail.create( session[:user_id] , 'Delete', 'AccStudentAccount','delete DiscountType account no =   #{@data.account_no} ',"#{params}");
                render :json => { :data =>  @data , :success => 'true' , :total => 1}
            else
                render json: { success: false, errors:  @data.errors }
            end            
        rescue Exception => e
            puts e.backtrace 
            render json:{ success:false , message:e.message }
        end

    end

    def deposit_on_lead_module
        begin
            AccStudentAccount.transaction do
                obj =permit_data_deposit

                helper = AccStudentAccountHelper

                if helper.check_cash_drawer_is_open(session[:user_id]) == false

                    render json:{ success:false , message:helper.get_message }

                else
                    finance_transaction = helper.transaction_deposit(obj,@@common , helper.get_drawer_id , session[:campus_id] , session[:user_id] )
                    #  insert into admissoin
                    @student = helper.insert_to_student obj , session[:campus_id], session[:user_id]
                    helper.insert_to_admission obj, session[:campus_id], session[:user_id],@student
                    if  finance_transaction == false

                        render json:{ success:false , message:helper.get_message}
                    else
                        render json:{ success:true ,finance_obj:finance_transaction , message:"Deposit success"}
                    end
                end
            end

        rescue Exception => e
            puts e.backtrace 
           render json:{success:false , message:"Deposit faild.Please contact to admin" }
        end
    end

    private
    def permit_data_deposit
        params.permit(
           :remark,
           :khr_amount,
           :usd_amount,
           :ref_no,
           :acc_payment_method_id,
           :lead_id
        )
    end
    def permit_data
        params.require(:data).permit(
                :id,
                :account_no,
                :lead_id,
                :student_id,
                :key_account_id,
                :credit_control_id,
                :account_type,
                :vat_number,
                :balance,
                :start_date,
                :end_date,
                :remark,
                :status,
                :campus_id,
                :created_at,
                :updated_at

            )
    end

    def get_index_sql(select)
        sql = "select #{select} from (select
            asa.* ,
            concat(sl.last_name , ' ' ,sl.first_name ) sdn_name,
            sl.degree_id ,
            sl.course_id ,
            '' student_no ,
            ad.name degree ,
            acf.name course ,
            sl.registered_date
            from
            acc_student_accounts asa
            inner join sdn_leads sl on asa.lead_id = sl.id and asa.student_id is null
            inner join acd_degrees ad on ad.id = sl.degree_id
            inner join acd_course_faculties acf on acf.id = sl.course_id
            union
            select
            asa.*,
            concat(ss.last_name , ' ' ,ss.first_name ) sdn_name,
            sa.degree_id,
            sa.course_id,
            ss.student_no,
            ad.name degree ,
            acf.name course ,
            ss.registered_date
            from
            acc_student_accounts asa
            inner join sdn_students ss on ss.id = asa.student_id and asa.student_id is not null
            inner join sdn_admissions sa on sa.student_id = asa.student_id
            inner join acd_degrees ad on ad.id = sa.degree_id
            inner join acd_course_faculties acf on acf.id = sa.course_id ) a
            "
        sql

    end
end
