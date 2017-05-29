Ext.define('ExtDesktop.store.acc.GroupAccount', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: true,
    controllerLoad: true,
    model: 'ExtDesktop.model.acc.GroupAccount',
    proxy: {
        type: 'rest',
        url: '/acc_group_account',
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
