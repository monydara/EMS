Ext.define('ExtDesktop.model.admission.Admission', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"admission_no",
		"reference_no",
		"admission_date",
		"admission_by_id",
		"admission_type",
		"program_type",
		"tuition_time_id",
		"term_id",
		"s_level_id",
		"c_level_id",
		"batch_id",
		"degree_id",
		"course_id",
		"class_shift_id",
		"major_id",
		"class_id",
		"start_acd_year_id",
		"end_acd_year_id",
		"note",
		"status",
		"student_id",
		"student_name",
		"dob",
		"gender",


		// student information
		"image_url",
		"category_id",
		"title_id",
		"student_code",
		"student_no",
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
		"occupation_id",
		"national_id",
		"religion_id",
		"langauge_id",
		"ethnicity_id",
		"national_no",
		"passport_no",
		"note",
		"status",
		"handler",
		"from_city_id",

		// admission info
		"batch_name",
		"degree_name",
		"course_name",
		"class_shift_name",
		"term_name",
		"acd_year",
		"shift",
		// account information
		"key_account_id",
		"plan_id",
		"pay_type",
		"credit_control_id",


		// dto account
		"account_no",
		"account_status",
		"balance",
		"cycle_name",
	]
});
