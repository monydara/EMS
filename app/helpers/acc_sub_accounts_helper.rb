module AccSubAccountsHelper
    def self.get_data params
        data = []
        if !params[:student_account_id].nil?
            data = AccSubAccount.joins(

                    :acc_fee_plan ,
                    :acc_cycle_type,
                    :acd_tuition_time

                    ).joins("
                    left join acd_batches on acd_batches.id = acc_sub_accounts.batch_id
                    left join acd_terms on acd_terms.id = acc_sub_accounts.term_id
                    ").select(
                        "acc_sub_accounts.* , acd_terms.term_name  ,
                         acc_fee_plans.plan_name , acc_cycle_types.cycle_name ,
                         acd_tuition_times.tuition_name , acd_batches.name batch_name"
                    )

        end
        data
    end
end
