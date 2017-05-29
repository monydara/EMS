Ext.define('ExtDesktop.store.TuitionTimeS', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.TuitionTimeM',
    proxy: {             
            type: 'rest',
            url:'/acd_degrees',                     
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