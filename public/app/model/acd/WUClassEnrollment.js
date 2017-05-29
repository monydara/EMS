Ext.define('ExtDesktop.model.acd.WUClassEnrollment', {
    extend: 'Ext.data.Model',
    fields: [
        "id",
        "class_code",
        "class_name",
        "program_type",
        "degree_id",
        "course_id",
        "standard_id",
        "division_id",
        "academic_year_id",
        "room_id",
        "class_shift_id",
        "session_id",
        "is_gpa",
        "credit",
        "start_date",
        "end_date",
        "description",
        "status",
        "campus_id",
        "created_at",
        "updated_at",
//student column
        "acd_class_wu_detail_attributes",
        "class_room",
        "degree",
        "course",
        "term",
        "session",
        "class_room_id",
        "class_division",
        "academic_year",
        "standard",
        "student_id",
        "student_no",
        "last_name",
        "first_name",
        "gender",
        "date_of_birth",
        "batch",
        "degree",
        "course",
        "sdn_class_student_attributes",
        "is_del",
        "dob",
        "registered_date"

    ]
});