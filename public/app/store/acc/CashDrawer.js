Ext.define('ExtDesktop.store.acc.CashDrawer', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    controllerLoad: false,
    model: 'ExtDesktop.model.CashDrawer',
    proxy: {
        type: 'rest',
        url: '/acc_cash_drawers',
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
