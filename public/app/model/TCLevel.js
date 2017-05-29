Ext.define('ExtDesktop.model.TCLevel', {
    extend: 'Ext.data.Model',
    fields: [
			'id',
			'code',
			'name',
			'course_id',
			'level_type_id',
			'level_type',
            'sequence',
			'created_at',
			'updated_at',
	]
});