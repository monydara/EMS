Ext.define('ExtDesktop.model.acc.DiscountCourse', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"discount_item_id",
		"course_id",
		"code",
		'abbr',
		'name',
		'course_type', 
		"_destroy"

		]
});