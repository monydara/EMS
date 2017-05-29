Ext.define('ExtDesktop.model.acc.InvoiceRule', {
    extend: 'Ext.data.Model',
    fields: [
			"id",
			"rule_name",
			"from_days",
			"to_days",
			"credit_control_id",
			"alert_type_id",
			"action_type_id",
			'charge_per_day',
			"description",
			"is_active",
			"is_del",
			"created_at",
			"updated_at"
		]
});