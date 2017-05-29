Ext.define('ExtDesktop.store.lookup.CmbReligion', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.Religion',   
    proxy: {             
            type: 'rest',
            url:'/CfgReligions/get_all', 
                            
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