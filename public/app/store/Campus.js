Ext.define('ExtDesktop.store.Campus', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:true,
    model: 'ExtDesktop.model.Campus',
    proxy: {             
        type: 'rest',
        url:'/gen_campus',                     
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