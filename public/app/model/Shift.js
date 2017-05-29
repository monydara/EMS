Ext.define('ExtDesktop.model.Shift', {
    extend: 'Ext.data.Model',
    fields: [
                'id',
				'shift_name',
				'shift_type',
				'start_time',
				'end_time',
				'description',
                'campus_id'
	]
});