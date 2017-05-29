Ext.define('ExtDesktop.model.acc.AccountDetail', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"account_id",
		"item_id",
		"item_type",
		"item_unit",
		"item_value",
		"is_recurring",
		"recurring_val",
		"effective_date",
		"expired_date",
		"comments",
		"is_deleted",
		
		"item_name"
		]
});