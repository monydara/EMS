Ext.define('ExtDesktop.model.acc.InvoiceDetail', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"invoice_id",
		"item_type",
		"item_id",
		"amount",
		"description",
		"is_deleted",
		"created_at",
		"updated_at",
		"item_name"
		]
});