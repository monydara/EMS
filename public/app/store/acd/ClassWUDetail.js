Ext.define('ExtDesktop.store.acd.ClassWUDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:false,
    model: 'ExtDesktop.model.acd.ClassWUDetail',
    proxy: {             
        type: 'rest',
        url:'/AcdClassWu/get_wu_detail',                     
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