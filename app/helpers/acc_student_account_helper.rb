module AccStudentAccountHelper

    @message = ""
    @drawer_id = 0
    @acc_fin_tran=nil

    def self.insert_to_student obj, campus_id , user_id
        # check if exist student no insert
        lead_id = obj["lead_id"].to_i
        @sdn = check_student_exist(lead_id , campus_id )
        if  @sdn == false
            @lead = SdnLead.find lead_id

            @student = SdnStudent.new
            @student.lead_id= lead_id
            @student.first_name = @lead.first_name
            @student.last_name = @lead.last_name
            @student.khr_first_name = @lead.khr_first_name
            @student.khr_last_name = @lead.khr_last_name
            @student.gender = @lead.gender
            @student.date_of_birth = @lead.date_of_birth

            @student.place_of_birth = @lead.place_of_birth
            @student.phone_no = @lead.phone_no
            @student.email = @lead.email
            @student.address = @lead.address
            @student.image_url = @lead.photo_path
            @student.handler =check_handler @lead.degree_id

            @student.status = "N"

            @student.campus_id = campus_id
            @student.registered_date = DateTime.now

            @student.save
            # student contact
            emergencyContact = SdnContact.new
            emergencyContact.student_id = @student.id
            emergencyContact.contact_type = "E"
            emergencyContact.save

            fatherContact = SdnContact.new
              fatherContact.student_id = @student.id
              fatherContact.contact_type = "F"
              fatherContact.gender = 'M'
              fatherContact.save

            motherContact = SdnContact.new
              motherContact.student_id =  @student.id
              motherContact.contact_type = "M"
              motherContact.gender = "F"
              motherContact.save

              dataStudent = SdnStudentKhr.new
            dataStudent.student_id = @student.id
            dataStudent.save


            @student.id
        else
            @sdn.id
        end

    end
    def self.insert_to_admission obj, campus_id , user_id , student_id
        # check if admission exist 
        if check_admission_exist(student_id , obj["lead_id"], campus_id) == false 
            @admission = SdnAdmission.new
            @lead = SdnLead.find obj["lead_id"]
            @admission.lead_id = obj['lead_id'].to_i
            @admission.student_id = student_id
            @admission.admission_by_id = user_id
            @admission.admission_type = "N"
            @admission.degree_id = @lead.degree_id
            @admission.course_id = @lead.course_id
            @admission.class_shift_id = @lead.class_shift_id
            @admission.campus_id = campus_id

            degree_type = check_handler @lead.degree_id
            if degree_type == "WU"
                @admission.batch_id = 0
            end

            # admission Date ?

            @admission.save
        end

       

    end

    def self.check_admission_exist student_id , lead_id , campus_id 
        @admission = SdnAdmission.find_by student_id:student_id , lead_id:lead_id , campus_id:campus_id 
        if @admission.nil?
            false
        else 
            true 

        end
        
    end

    def self.transaction_deposit obj, common , drawer_id,campus_id , user_id
        begin
            is_success = true
            amount_usd = convert_amount_to_usd obj

            # 1- update student balance
            student_account =  AccStudentAccount.find_by lead_id:obj['lead_id'].to_i
            student_account.balance+=amount_usd
            student_account.save

            # 2- insert into acc_finance_trans
            finance_tran = AccFinanceTran.new
            finance_tran.receipt_no =common.getNextCode("RECEIPT", student_account.campus_id)
            finance_tran.acc_tran_type_id = 6

                # id from  drawer id
            finance_tran.acc_cash_drawer_tran_id = drawer_id
            finance_tran.acc_payment_method_id = obj['acc_payment_method_id']
            finance_tran.ref_no = obj['ref_no']
            finance_tran.tran_date = Date.today
            finance_tran.amount_usd = amount_usd
            finance_tran.amount_khr = obj['khr_amount'].to_f

              # finance_tran.commited_date
            finance_tran.remark = obj['remark']
            finance_tran.campus_id =campus_id
            finance_tran.user_id = user_id
            finance_tran.save
            @acc_fin_tran=finance_tran

            #insert prepayment transaction
            prepaid=AccPrePayment.new
            prepaid.lead_id=obj['lead_id']
            prepaid.fin_tran_id=@acc_fin_tran.id
            prepaid.trn_date=Date.today

            if obj['khr_amount'].to_f>0
              prepaid.currency='KHR'
              prepaid.trn_amount=obj['khr_amount'].to_f
              prepaid.ex_rate=4100
            else
              prepaid.currency='USD'
              prepaid.trn_amount=amount_usd
              prepaid.ex_rate=1
            end


            prepaid.lcy_amount=amount_usd
            prepaid.remark= obj['remark']
            prepaid.maker_id=user_id
            prepaid.campus_id=campus_id
            prepaid.save

            is_success

        rescue Exception => e
            @message =  "========== Error: #{e.message}"
            false
        end
    end

    def self.check_cash_drawer_is_open user_id
        begin
            is_success = true
            cash_drawer = AccCashDrawer.find_by sys_user_id:user_id,is_active:true,is_deleted:false
            #  check in cash drawer group
            if cash_drawer.nil?
                 @message = "You account cannot recieve money. please add your account to group cashier "
                 is_success = false
            else
                # check if cash drawer not yet open
                drawer_transaction = AccCashDrawerTran.find_by acc_cash_drawer_id:cash_drawer.id , closed_by:nil

                if drawer_transaction.nil?
                    @message = "Please open your account cash drawer before recieve money "
                    is_success = false
                else
                    @drawer_id = drawer_transaction.id
                end
            end

            is_success
        rescue Exception => e
            puts "=======AccStudentAccountHelper check_cash_drawer_is_open: Error(#{e.message}) "
            false
        end

    end

    def self.get_drawer_id
        @drawer_id
    end

    def self.get_message
         @message
    end

    def self.get_fin_tran
      @acc_fin_tran
    end

    private
    def self.check_handler  degree_id
        @data =  AcdDegree.find degree_id
        @data.degree_type

    end
    def self.check_student_exist lead_id,campus_id
        @student = SdnStudent.find_by lead_id:lead_id, campus_id:campus_id
        if @student.nil?
            false
        else
            @student
        end
    end

    def self.convert_amount_to_usd obj
        usd_amount = obj["usd_amount"].to_f
        khr_amount = obj['khr_amount']
        if !khr_amount.nil? && khr_amount.to_f > 0
            usd_amount = khr_amount.to_f / 4100
        end
        usd_amount
    end

end
