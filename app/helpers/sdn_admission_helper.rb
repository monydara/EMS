module SdnAdmissionHelper
    @@total_record = 0

    def self.get_student_data params
        data = []
        # check type of request

        if !params[:student_id].nil? && !params[:student_id].empty? # requst in form student detail
           puts "=-======== get result admission "
            data = get_result_admission params
        elsif params[:type].to_s == "WU"
           puts "=-======== get result admission WU "

            data = get_result_wu params
        elsif params[:type].to_s == "TC"
           puts "=-======== get result admission TC "
           
            data =get_result_tc params
        else
           puts "=-======== get result other Admission "
            
            data =  get_result params
        end

        data
    end

    def self.get_result_admission params
        data = SdnAdmission.joins(:acd_degree,:acd_course_faculty,:cfg_academic_year,:acd_class_shift).where student_id:params[:student_id]
        result = data.select(" sdn_admissions.* , acd_degrees.name degree_name ,acd_class_shifts.name shift
        , acd_course_faculties.name course_name, cfg_academic_years.name acd_year")
        set_total_record data
        result
    end

    def self.get_result params
        data =get_data params
        result =data.select("
                sdn_students.*,
                Concat(sdn_students.first_name , ' ' ,sdn_students.last_name) as student_name ,
                acd_batches.name batch_name ,
                acd_degrees.name degree_name ,
                acd_course_faculties.name course_name,
                acd_class_shifts.name class_shift_name,

                sdn_admissions.admission_no ,
                sdn_admissions.reference_no,
                sdn_admissions.tuition_time_id ,
                sdn_admissions.term_id ,
                sdn_admissions.s_level_id ,
                sdn_admissions.c_level_id ,
                sdn_admissions.batch_id ,
                sdn_admissions.degree_id ,
                sdn_admissions.course_id ,
                sdn_admissions.class_shift_id ,
                sdn_admissions.major_id ,
                sdn_admissions.admission_date,
                sdn_admissions.admission_type ,
                sdn_admissions.start_acd_year_id")
         set_total_record data
         result
    end

    def self.get_result_wu params
        data = get_data_wu params
        result = data.select("
            sdn_students.lead_id,
            sdn_students.category_id,
            sdn_students.title_id,
            sdn_students.student_code,
            sdn_students.student_no,
            sdn_students.first_name,
            sdn_students.last_name,
            sdn_students.khr_first_name,
            sdn_students.khr_last_name,
            sdn_students.gender,
            sdn_students.date_of_birth,
            sdn_students.registered_date,
            sdn_students.place_of_birth,
            sdn_students.phone_no,
            sdn_students.email,
            sdn_students.address,
            sdn_students.from_city_id,
            sdn_students.occupation_id,
            sdn_students.national_id,
            sdn_students.religion_id,
            sdn_students.langauge_id,
            sdn_students.ethnicity_id,
            sdn_students.national_no,
            sdn_students.passport_no,
            sdn_students.note,
            sdn_students.image_url,
            sdn_students.handler,
            sdn_students.campus_id,
            sdn_students.id student_id, 
            Concat(sdn_students.first_name , ' ' ,sdn_students.last_name) as student_name ,


            acd_batches.name batch_name ,
            acd_degrees.name degree_name ,
            acd_course_faculties.name course_name,
            acd_class_shifts.name class_shift_name,
            sdn_admissions.admission_no ,
            sdn_admissions.reference_no,
            sdn_admissions.id ,
            sdn_admissions.status,
            sdn_admissions.tuition_time_id ,
            sdn_admissions.term_id ,
            sdn_admissions.s_level_id ,
            sdn_admissions.c_level_id ,
            sdn_admissions.batch_id ,
            sdn_admissions.degree_id ,
            sdn_admissions.course_id ,
            sdn_admissions.class_shift_id ,
            sdn_admissions.major_id ,
            sdn_admissions.admission_date,
            sdn_admissions.admission_type ,
            sdn_admissions.start_acd_year_id
        ").paginate(:page => params[:page], :per_page => params[:limit])

        set_total_record data

        result
    end
    def self.get_result_tc params
        data  = get_data_tc params

        result  = data.select("
                distinct
                sdn_students.id student_id ,
                sdn_students.lead_id,
                sdn_students.category_id,
                sdn_students.title_id,
                sdn_students.student_code,
                sdn_students.student_no,
                sdn_students.first_name,
                sdn_students.last_name,
                sdn_students.khr_first_name,
                sdn_students.khr_last_name,
                sdn_students.gender,
                sdn_students.date_of_birth,
                sdn_students.registered_date,
                sdn_students.place_of_birth,
                sdn_students.phone_no,
                sdn_students.email,
                sdn_students.address,
                sdn_students.from_city_id,
                sdn_students.occupation_id,
                sdn_students.national_id,
                sdn_students.religion_id,
                sdn_students.langauge_id,
                sdn_students.ethnicity_id,
                sdn_students.national_no,
                sdn_students.passport_no,
                sdn_students.note,
                sdn_students.image_url,
                sdn_students.id student_id, 
                sdn_students.handler,
                sdn_students.campus_id,
                Concat(sdn_students.first_name , ' ' ,sdn_students.last_name) as student_name ,


                acd_degrees.name degree_name ,
                acd_course_faculties.name course_name,
                acd_class_shifts.name class_shift_name,
                acd_terms.term_name term_name ,

                sdn_admissions.admission_no ,
                sdn_admissions.reference_no,
                sdn_admissions.id ,
                sdn_admissions.tuition_time_id ,
                sdn_admissions.term_id ,
                sdn_admissions.s_level_id ,
                sdn_admissions.c_level_id ,
                sdn_admissions.batch_id ,
                sdn_admissions.degree_id ,
                sdn_admissions.course_id ,
                sdn_admissions.class_shift_id ,
                sdn_admissions.major_id ,
                sdn_admissions.admission_date,
                sdn_admissions.admission_type ,
                sdn_admissions.start_acd_year_id,
                sdn_admissions.status
               

            ").paginate(:page => params[:page], :per_page => params[:limit])

        set_total_record data

        result
    end

    def self.get_data params
        text = params[:text]
        condition="sdn_students.status <> 'C' and sdn_students.status <> 'N'  "
        if  text.nil?
            text = ""
        else
            text = "%#{text}%"
            condition+=" and ( sdn_students.student_no like '#{text}'
                    or sdn_students.first_name like '#{text}'
                    or sdn_students.last_name like '#{text}'
                )"
        end
        SdnAdmission.joins(
               "left join  sdn_students on sdn_students.id = sdn_admissions.student_id
                left join acd_class_shifts on acd_class_shifts.id = sdn_admissions.class_shift_id
                left join acd_batches on acd_batches.id = sdn_admissions.batch_id
                left join acd_course_faculties on acd_course_faculties.id = sdn_admissions.course_id
                left join acd_degrees on acd_degrees.id = sdn_admissions.degree_id
                "
            ).where(condition)
    end
    def self.get_data_wu params
        condition = " not sdn_admissions.batch_id is null  and sdn_students.status <> 'C'"
        text = params[:text]
        if  text.nil?
            text = ""
        else
            text = "%#{text}%"
            condition+=" and ( sdn_students.student_no like '#{text}'
                    or sdn_students.first_name like '#{text}'
                    or sdn_students.last_name like '#{text}'
                )"
        end
        SdnAdmission.joins(
                :sdn_student ,
                :acd_class_shift,

                :acd_degree ,
                :acd_course_faculty
            ).joins("
                left join acd_batches on acd_batches.id = sdn_admissions.batch_id
            ").where(condition)
    end

    def self.get_data_tc params
        puts 'admission tc'
        condition = " sdn_admissions.batch_id is null and sdn_students.status <> 'C' "
        text = params[:text]
        if text.nil?
           text = ""
        else
            text = "%#{text}%"
            condition+=" and ( sdn_students.student_no like '#{text}'
                    or sdn_students.first_name like '#{text}'
                    or sdn_students.last_name like '#{text}'
                )"
        end

        if !params[:admission_status].nil?  && !params[:admission_status].empty? && params[:admission_status] == "A"
            condition+=" and sdn_admissions.status = 'A' "
        end

       SdnAdmission.joins("
            left join sdn_students on sdn_admissions.student_id = sdn_students.id
            left join acd_class_shifts on acd_class_shifts.id = sdn_admissions.class_shift_id
            left join acd_terms on acd_terms.id = sdn_admissions.term_id
            left join acd_degrees on acd_degrees.id = sdn_admissions.degree_id
            left join acd_course_faculties on acd_course_faculties.id = sdn_admissions.course_id
            "
            ).where(condition)
            # left join acc_student_accounts on acc_student_accounts.student_id =sdn_students.id
    end


    def self.set_total_record data
        @@total_record = data.count
    end
    def self.get_total_record
        @@total_record
    end

end
