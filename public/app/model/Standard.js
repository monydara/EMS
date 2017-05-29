Ext.define('ExtDesktop.model.Standard', {
    extend: 'Ext.data.Model',
    fields: [
			"id",
			"code",
			"name",
			"sequence",
			"is_deleted",
			"created_at",
			"updated_at",
			"khr_name",
			"acd_standard_division_attributes"
	]
});