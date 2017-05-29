Ext.define('ExtDesktop.store.TaxRate', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    model: 'ExtDesktop.model.TaxRate',
    proxy: {
        type: 'rest',
        url: '/acc_tax_rate',
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
