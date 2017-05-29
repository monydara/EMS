Ext.define('ExtDesktop.store.hr.Employee', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'ExtDesktop.model.Employee',
    proxy: {
        type: 'rest',
        url: '/hr_employees',
        reader: {
            type: 'json',
            root: 'data',
            successProperty: 'success'
        },
        writer: {
            getRecordData: function(record) {
                return {
                    data: record.data
                };
            }
        },
        listeners: {
            exception: function(proxy, response, operation) {
                Util.sessionTimeOut(response.responseText);
            }
        }
    }
});
