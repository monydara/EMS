module AccPrePaymentHelper

  def self.rollback_deposit p_id,p_user_id
    # Logic Rollback transaction #
    #1. Update status to rollback in prepayment table
    #2. Update rollback date in financial transaction
    #3. Reverse balance back and deposit amount

    begin
      #1. Update status to rollback in prepayment table
      @prepaid=AccPrePayment.find(p_id)

      if !@prepaid.nil? && @prepaid.status=='B'
        #1. Update status to rollback in prepayment table
        @prepaid.status='R'
        @prepaid.checker_id=p_user_id
        @prepaid.save

        #2. Update rollback date in financial transaction
        @finance=AccFinanceTran.find(@prepaid.fin_tran_id)
        @finance.rollback_date=Date.today
        @finance.save


        #3. Reverse balance back and deposit amount
        @account=AccStudentAccount.find(@prepaid.lead_id)

        if @account.balance<@prepaid.lcy_amount && @account.balance>0
          @account.balance=0.0
        else
          @account.balance -=@prepaid.lcy_amount
        end
        if @account.deposit_amount >=@prepaid.lcy_amount
          @account.deposit_amount -=@prepaid.lcy_amount
        else
          @account.deposit_amount=0.0
        end

        @account.save
      else
        false
      end

    rescue Exception => e
      @message =  "========== Error: #{e.message}"
      false
    end
  end
end
