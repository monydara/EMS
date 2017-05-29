Ext.define('ExtDesktop.store.District', {
    extend: 'Ext.data.Store',	
    autoLoad:false,
    model: 'ExtDesktop.model.District',
    proxy: {             
        type: 'rest',
        url:'/gen_districts',                     
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