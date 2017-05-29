Ext.define('ExtDesktop.store.Commune', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.Commune',
    proxy: {             
        type: 'rest',
        url:'/gen_communes',                     
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