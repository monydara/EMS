Ext.define('ExtDesktop.store.Student', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    model: 'ExtDesktop.model.Student',
    proxy: {
        type: 'rest',
        url: '/sdn_student',
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
