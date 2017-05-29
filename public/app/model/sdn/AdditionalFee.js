
Ext.define('ExtDesktop.model.sdn.AdditionalFee', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"fee_charge_id",
		"item_charge_id",
		"charge_amount",
		"is_recurring",
		"is_bill",
		"note",
		"is_del", 

		"fee_charge", 
		"_destroy"
    ]
});