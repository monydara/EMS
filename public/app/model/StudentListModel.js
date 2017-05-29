Ext.define('ExtDesktop.model.StudentListModel', {
    extend: 'Ext.data.Model',
    fields: [
                  // from table students
            "id",
            "student_code",
            "student_no",
            "first_name",
            "last_name",
            "gender",
            "status",
            "campus_id",
                  // from table admission
            "degree_id",
            "course_id",
            "start_acd_year_id",
            "class_shift_id",
                  // field from table acd_course_faculties,acd_degrees,acd_academic_year,acd_class_shifts (see at server side rename so we use this name)
            "course",
            "degree",
            "academic_year",
            "shift_name",
                  // for table sdn_status_logs
            "admission_id",
            "student_id"
             
             
	]
});