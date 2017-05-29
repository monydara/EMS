Ext.define('ExtDesktop.model.acc.ChargeItem', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"item_code",
		"item_name",
		"item_type_id",
		"charge_amount",
		"note",
		"campus_id",
		"is_del",
		"created_at",
		"updated_at",
		 'is_editable',
        'status',
        {
            name: 'charge_item',
            convert: function(v, rec) {
                var custom = rec.get('is_editable');
                if (custom) {
                    custom = "(Allow Adjustment)"
                } else {
                    custom = "";
                };


                return rec.get('item_name')  + custom;

            }
        }

		]
});
