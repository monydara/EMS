module SdnLeadHelper

    def self.insert_into_acc_student_account(lead , account_no)
        begin
            @data = AccStudentAccount.new
# don't know about the format
            @data.account_no = account_no
            @data.lead_id = lead.id
            @data.account_type = "N" # for normal account
            @data.status = "N" #New
            @data.campus_id = lead.campus_id
            @data.balance = 0
            @data.save
# key_account_id int(11)
# credit_control_id int(11)
# account_type varchar(1)
# vat_number varchar(20)
# balance decimal(12,2)
# start_date date
# end_date date
# remark text
# campus_id int(11)
# created_at datetime
# updated_at datetime
# edu_type varchar(2)


            true
        rescue Exception => e
            false
        end
    end
end
