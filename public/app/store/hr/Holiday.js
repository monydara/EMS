Ext.define('ExtDesktop.store.hr.Holiday', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    model: 'ExtDesktop.model.Holiday',
    proxy: {
        type: 'rest',
        url: '/hr_holiday',
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
