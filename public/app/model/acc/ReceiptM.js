Ext.define('ExtDesktop.model.acc.ReceiptM', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"receipt_date",
		"receipt_no",
		"receipt_type",
		"ref_type",
		"payer_name",
		"ref_id",
		"usd_amount",
		"khr_amount",
		"charges_amount",
		"discount_amount",
		"remark",
		"is_paid",
		"paid_date",
		"is_del",
		"receipt_by_id",
		"campus_id",

		"acc_receipt_detail_attributes"

		]
});