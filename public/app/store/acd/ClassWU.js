Ext.define('ExtDesktop.store.acd.ClassWU', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    controllerLoad:true,
    model: 'ExtDesktop.model.acd.ClassWU',
    proxy: {
        type: 'rest',
        url: '/acd_class_wu',
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
