module SdnStudentHelper
    @tmpContact = nil
    def self.get_string_advance_search params
        text_search = ""
        df_from_date = params[:df_from_date]
        df_to_date = params[:df_to_date]
        batch_id = params[:batch_id]
        academic_year_id = params[:academic_year_id]
        degree_id = params[:degree_id]
        course_id = params[:course_id]
        major_id = params[:major_id]
        shift_id = params[:shift_id]
        tf_keyword = params[:tf_keyword]

        if !df_from_date.nil? && !df_to_date.nil? && !df_from_date.empty? && !df_to_date.empty?
            text_search+=" and sdn_admissions.admission_date between '#{df_from_date}' and '#{df_to_date}' "
        end

        if !batch_id.nil? && !batch_id.empty?
            text_search+=" and sdn_admissions.batch_id = #{batch_id}"
        end

        if !academic_year_id.nil? && !academic_year_id.empty?
            text_search+=" and sdn_admissions.start_acd_year_id = #{academic_year_id}"
        end

        if !degree_id.nil? && !degree_id.empty?
            text_search+=" and sdn_admissions.degree_id = #{degree_id}"
        end

        if !course_id.nil? && !course_id.empty?
            text_search+=" and sdn_admissions.course_id = #{course_id}"
        end

        if !major_id.nil? && !major_id.empty?
            text_search+=" and sdn_admissions.major_id = #{major_id}"
        end

        if !shift_id.nil? && !shift_id.empty?
            text_search+=" and sdn_admissions.tuition_time_id = #{shift_id}"
        end

        if !tf_keyword.nil? && !tf_keyword.empty?
            text_search+=" and ( sdn_students.first_name like '%#{tf_keyword}%' or sdn_students.last_name like '%#{tf_keyword}%' )"
        end

        text_search

    end

    def self.check_student_account(student , campus_id)
        common = CommonFunction.new

        # check if student is create from lead
        if  !student.lead_id.nil?
           @student_account =  AccStudentAccount.find_by lead_id:student.lead_id
           @student_account.update_attributes(student_id:student.id)
        else
            # if don't create from so need to insert new record in student account
            acc_no = "#{common.getNextCode 'ACCOUNT NO' ,campus_id}"

            @student_account = AccStudentAccount.new
            @student_account.account_no = acc_no
            @student_account.student_id = student.id
            @student_account.status = "N"
            @student_account.campus_id = campus_id
            @student_account.save

        end

    end

    def self.check_exist_student_contact(student_id , contact_type)
        @data = SdnContact.find_by student_id:student_id , contact_type:contact_type
        if @data.nil?
            return false
        else
            @tmpContact = @data
            return true
        end

    end

    def self.get_tmp_contact
        return  @tmpContact
    end


    def self.save_student_khr(student_id , student_obj)
        @data = SdnStudentKhr.find_by student_id:student_id

        if @data.nil?
            dataStudent = SdnStudentKhr.new(student_obj)
            dataStudent.student_id = student_id
            dataStudent.save
        else
            @data.update_attributes(student_obj)
        end

        return @data

    end
end
