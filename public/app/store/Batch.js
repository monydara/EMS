Ext.define('ExtDesktop.store.Batch', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    model: 'ExtDesktop.model.Batch',
    proxy: {
        type: 'rest',
        url: '/acd_batchs',
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
