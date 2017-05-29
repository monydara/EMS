Ext.define('ExtDesktop.model.Role', {
    extend: 'Ext.data.Model',
    fields: [
                'id',
                'code',
                'name',
                'description',
                {name:'createdDate',type:'date',dateFormat: 'time' }
	]
});


