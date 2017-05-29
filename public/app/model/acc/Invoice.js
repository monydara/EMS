Ext.define('ExtDesktop.model.acc.Invoice', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"account_id",
		"invoice_no",
		"invoice_type",
		"degree_id",
		"course_id",
		"batch_id",
		"standard_id",
		"division_id",
		"course_level_id",
		"term_id",
		"cycle_type_id",
		"vat_number",
		"issue_date",
		"due_date",
		"from_date",
		"to_date",
		"total_amount",
		"is_paid",
		"billing_process_id",
		"campus_id",
		"created_at",
		"updated_at",
		"group_account_id"
		]
});