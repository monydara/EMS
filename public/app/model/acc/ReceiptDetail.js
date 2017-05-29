Ext.define('ExtDesktop.model.acc.ReceiptDetail', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"receipt_id",
		"item_type",
		"item_id",
		"amount",
		"description",
		"item_name",
		"item_unit",
		"_destroy"
	]
});