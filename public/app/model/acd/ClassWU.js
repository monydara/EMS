Ext.define('ExtDesktop.model.acd.ClassWU', {
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
        "is_gpa",
        "credit",
        "start_date",
        "end_date",
        "description",
        "status",
        "campus_id",
        "created_at",
        "updated_at",

        "acd_class_wu_detail_attributes",
        "class_room",
        "degree",
        "course",
        "term",
        "session",
        "class_room"
	]
});