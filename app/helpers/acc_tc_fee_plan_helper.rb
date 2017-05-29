module AccTcFeePlanHelper

    def self.check_exist_code(fee_plan)
        result = false
        # @data = AccTcFeePlan.find plan_master_id

        if !(fee_plan.id).nil?

            @data =AccTcFeePlan.where plan_code:fee_plan.plan_code
            @data = @data.where.not(id:fee_plan.id)
        else
            @data =AccTcFeePlan.where plan_code:fee_plan.plan_code
        end



         if @data.count > 0
            # for restult already exist active
            result = true
        end

        result

    end
end
