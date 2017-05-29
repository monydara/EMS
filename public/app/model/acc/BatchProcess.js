Ext.define('ExtDesktop.model.acc.BatchProcess', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"group_account_id",
		"batch_proc_code",
		"batch_proc_name",
		"proc_date",
		"total_invoices",
		"status",
		"campus_id",
		"created_at",
		"updated_at",
		"group_name"
		]
});