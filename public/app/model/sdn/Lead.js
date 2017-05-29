Ext.define('ExtDesktop.model.sdn.Lead', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"title_id",
		"first_name",
		"last_name",
		"khr_first_name",
		"khr_last_name",
		"gender",
		"date_of_birth",
		"registered_date",
		"place_of_birth",
		"phone_no",
		"email",
		"address",
		"note",
		"image_url",
		"degree_id",
		"course_id",
		"class_shift_id",
		"is_canceled",
		"campus_id",
		"created_at",
		"updated_at",

		"course",
		"class_shift",
		"degree",
		"student_no"
	]
});
