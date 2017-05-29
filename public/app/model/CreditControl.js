Ext.define('ExtDesktop.model.CreditControl', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"policy_name",
		"due_days",
		"description",
		"is_active",
		"is_del",
		"campus_id"
	]
});