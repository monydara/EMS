Ext.define('ExtDesktop.store.acc.Currency', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    // controllerLoad: false,
    autoLoad: true,
    controllerLoad: true,
    model: 'ExtDesktop.model.acc.Currency',
    proxy: {
        type: 'rest',
        url: '/acc_currency',
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
