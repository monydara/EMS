Ext.define('ExtDesktop.store.TaxType', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    model: 'ExtDesktop.model.TaxType',
    proxy: {
        type: 'rest',
        url: '/acc_tax_type',
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
