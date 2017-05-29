Ext.define('ExtDesktop.model.acc.AccountMaster', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"student_id",
		"admission_id",
		"key_account_id",
		"credit_control_id",
		"fee_cat_id",
		"fee_type",
		"cycle_type_id",
		"account_type",
		"fee_per_cycle",
		"balance",
		"status", 
		"group_account_id",

		"admission_no",
		"cycle_name",
		"course_name",
		"degree_name",
		"date_of_birth",
		"student_no",
		"student_name"
		]
});