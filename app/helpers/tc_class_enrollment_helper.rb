module TcClassEnrollmentHelper

    def self.get_data params,common,campus_id#grid1 after add// put student in class
        sql = ""
        # check if client request student in class
        if !params[:class_id].nil?
            sql = get_sql_student_enrolled# select student that already has class
            data =  SdnClassTcStudent.joins(
                    :acd_class_tc,
                    :sdn_student , 
                    :sdn_admission
            ).where(class_id: params[:class_id] ,campus_id:campus_id , is_del:false )

           result = data.select(sql)

           return :json => { data:result , total:data.count , success:true  }


        else #grid 2 search for add
            return :json=>{ data:[] , success:true }
        # # check for condition and  student list by advance search
        #    sql = get_sql_student_in_search# select students that already admission
        #    condition = check_condition params#search for student
        #    data =  SdnStudent.joins(:sdn_admission => [ :acd_degree ,:acd_course_faculty]
        #     ).where(condition)# get student record from condition
        #    result = data.select(sql)
        #     common.returnJoinPaginate(data , result , params[:page] , params[:limit] )
        end

    end

    def self.udpate_class_admission admission_id , class_id 
        puts "=============== #{class_id}"
        data = SdnAdmission.find(admission_id)
        data.update_attributes(class_id:class_id)
    end


# ================== additional function in helper ==============
    def self.check_condition params
 #search in advance for student record
        text = params[:search]
  #test search for both above conditions
        if text.nil?
            text = "'%%'"
        else
            text = "'%#{params[:search]}%'"
        end

        condition = " ( sdn_admissions.admission_no like #{text}
            or
            sdn_students.student_code like #{text}
            or
            sdn_students.first_name like #{text}
            or
            sdn_students.last_name like #{text}
            or
            sdn_students.student_no like #{text}
            ) and acd_degrees.degree_type = 'TC' and sdn_students.status ='A' "
    #for advance search key word to get students record
        if !params[:academic_year_id].nil? && !params[:academic_year_id].empty?
            condition+=" and sdn_admissions.start_acd_year_id = #{params[:academic_year_id]} "
        end
        if !params[:degree_id].nil? && !params[:degree_id].empty?
            condition+=" and sdn_admissions.degree_id = #{params[:degree_id]} "
        end
        if !params[:course_id].nil? && !params[:course_id].empty?
            condition+=" and sdn_admissions.course_id = #{params[:course_id]} "
        end
        if !params[:tuition_time_id].nil? && !params[:tuition_time_id].empty?
            condition+=" and sdn_admissions.tuition_time_id = #{params[:tuition_time_id]} "
        end
        if !params[:course_level_id].nil? && !params[:course_level_id].empty?
            condition+=" and sdn_admissions.c_level_id = #{params[:course_level_id]} "
        end
        if !params[:class_shift_id].nil? && !params[:class_shift_id].empty?
            condition+=" and sdn_admissions.class_shift_id = #{params[:class_shift_id]} "
        end
        if !params[:term_id].nil? && !params[:term_id].empty?
            condition+=" and sdn_admissions.term_id = #{params[:term_id]} "
        end
        if !params[:category_id].nil? && !params[:category_id].empty?
            condition+=" and sdn_students.category_id = #{params[:category_id]} "
        end
        if !params[:occupation_id].nil? && !params[:occupation_id].empty?
            condition+=" and sdn_students.occupation_id = #{params[:occupation_id]} "
        end

        if !params[:from_date].nil? && !params[:from_date].empty? && !params[:to_date].nil? && !params[:to_date].empty?
            condition+=" and sdn_admissions.admission_date between '#{params[:from_date]}' and '#{params[:to_date]}'"
        end

        condition

    end

    def self.get_sql_student_in_search
        "
            sdn_students.*,
            sdn_admissions.term_id,
            sdn_admissions.tuition_time_id,
            sdn_admissions.degree_id,
            sdn_admissions.course_id,
            sdn_admissions.class_shift_id,
            sdn_admissions.major_id,

            acd_degrees.name degree,
            acd_course_faculties.name course

        "
    end

    def self.get_sql_student_enrolled
        "sdn_class_tc_students.*, 
        sdn_admissions.admission_no,
        concat( sdn_students.first_name ,' ' ,sdn_students.last_name) as student_name,

        sdn_students.student_no ,
        sdn_students.date_of_birth ,         
        sdn_admissions.status

        "
    end
    def self.check_student_exist data ,campus_id# parameter
        begin
            result = false

            data.sdn_class_student.each do |d|

               # in here for check condition student exist

                if d.id.nil?

                    # find student in this class
                    student_list = SdnClassStudent.where class_id:d.class_id,student_id:d.student_id,is_del:false,campus_id:campus_id
                    if student_list.count > 0

                        result = " Student Name = <B> #{d.sdn_student.first_name+' '+ d.sdn_student.last_name} </b> already exist in this class"# bos message
                    end


                end


            end

            puts"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL=#{result}"
            return result
        rescue Exception => e
            puts "=================Error: #{e.message}"
            return e.message
        end
    end
    

end
