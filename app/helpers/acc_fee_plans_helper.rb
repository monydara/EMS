module AccFeePlansHelper
    @message = ""
    def self.check_code_exist(fee_plan)
        result = false

        if !(fee_plan.id).nil?
            @data = AccFeePlan.where.not(id:fee_plan.id)
            @data = @data.where(plan_code:fee_plan.plan_code, campus_id:fee_plan.campus_id)
            if @data.count > 0
                result = true
            end
        else
            @data = AccFeePlan.where(plan_code:fee_plan.plan_code, campus_id:fee_plan.campus_id)
            if @data.count > 0
                result = true
            end
        end

        result

    end

    def self.get_plan_list params , campus_id , common
        begin

            condition = " campus_id = #{campus_id} "
            id = params[:id]
            if !id.nil?
                @sdn_acc = AccStudentAccount.find id
                if @sdn_acc.student_id.nil?
                    @lead = @sdn_acc.sdn_lead
                    condition+=" and degree_id = #{@lead.degree_id} and course_id = #{@lead.course_id} "
                else
                    @admission = @sdn_acc.sdn_student.sdn_admission
                    condition+=" and degree_id = #{@admission[0].degree_id} and course_id = #{@admission[0].course_id}  "
                end
            end


            if !params[:batch_id].nil? && !params[:batch_id].empty?
                condition+=" and  batch_id =#{params[:batch_id].to_i} "
            end

            if !params[:cycle_type_id].nil? && !params[:cycle_type_id].empty?
                condition+=" and  cycle_id =#{params[:cycle_type_id].to_i} "
            end

            if !params[:master_id].nil? && !params[:master_id].empty?
                condition+=" and  acc_plan_master_id =#{params[:master_id].to_i} "
            end

            if !params[:term_id].nil? && !params[:term_id].empty?
                condition+=" and  term_id =#{params[:term_id].to_i} "
            end

            if !params[:plan_name].nil?

                plan_name = "%#{params[:plan_name]}%"
                condition+="and plan_name like '#{plan_name}' "
            end

            sql = " select * from acc_fee_plans where #{condition} "
            data = AccFeePlan.find_by_sql sql
            total = data.count
            data =  AccFeePlan.find_by_sql "#{sql}
                    order by degree_name,course_name ,
                        batch_name , cycle_name,term_name,tuition_time
                    LIMIT  #{(params[:page].to_i-1)} , 25  "
            result ={ data:data , total:total}
            result
        rescue Exception => e
            @message = e.message
            false
        end
    end

    def self.get_message
        @message
    end
end
