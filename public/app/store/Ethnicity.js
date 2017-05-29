Ext.define('ExtDesktop.store.Ethnicity', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad : false,
    controller: false,
    model: 'ExtDesktop.model.Ethnicity',
    proxy: {             
            type: 'rest',
            url:'/cfg_ethinicities',
            reader: {
                type: 'json',
                root: 'data',
                successProperty: 'success'
            },
            writer: {
                getRecordData: function(record) {
                    return { data: record.data };
                }
            },
            listeners :
            {
                exception : function(proxy, response, operation)
                {
                   Util.sessionTimeOut(response.responseText);
                }
            }
        }
});