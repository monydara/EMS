Ext.define('ExtDesktop.store.City', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.City',
    proxy: {             
        type: 'rest',
        url:'/gen_cities',                     
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