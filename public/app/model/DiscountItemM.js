Ext.define('ExtDesktop.model.DiscountItemM', {
    extend: 'Ext.data.Model',
    fields: [
                'id',
				'item_code',
                'item_name',
                'is_all_courses',
                'discount_type_id',
                'name',
                'effective_date',
                'expired_date',
                'Autherizer',
                'reference_no',
                'note',
                'campus_id',
                'is_del',
                'acc_discount_item_details_attributes'
	]
});