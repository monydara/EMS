Ext.define('ExtDesktop.store.lookup.CmbTitle', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.Lookup',
     proxy: {             
            type: 'rest',
            url:'/cfg_look_ups', 
            extraParams: {
                type: 'TITLE'                    
            },                    
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