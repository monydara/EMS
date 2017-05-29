Ext.define('ExtDesktop.model.sdn.DiscountItem', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"fee_charge_id",
		"discount_item_detail_id",
		"discount_amount",
		"discount_p",
		"deduct_type",
		"is_bill",
		"discount_by_id",
		"note",
		"is_del",
		"created_at",
		"updated_at",
		"_destroy",

		"discount_item_detail"
	]
});