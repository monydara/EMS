Ext.define('ExtDesktop.model.Holiday', {
    extend: 'Ext.data.Model',
    fields: [
                'id',
                'code',
                'name',
                'khr_name',
                'start_date',
                'end_date',
                'academic_year_id',
                'description',
                'is_deleted',
                'acd_year'
                
	]
});