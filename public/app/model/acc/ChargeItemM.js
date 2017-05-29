Ext.define('ExtDesktop.model.acc.ChargeItemM', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'item_code',
        'item_name',
        'item_type_id',
        'item_type_name',
        'charge_amount',
        'note',
        'campus_id',
        'is_del',
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


                return rec.get('discount_value')  + custom;

            }
        }
    ]
});
