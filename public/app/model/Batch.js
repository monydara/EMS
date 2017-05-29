Ext.define('ExtDesktop.model.Batch', {
    extend: 'Ext.data.Model',
    fields: [
                "id",
                "code", 
                "name", 
                'campus',                   
                "gen_campus_id",
                "is_deleted", 
                'khr_name',
                // for table rel
                "batch_id"
	]
});