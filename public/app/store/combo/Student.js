Ext.define('ExtDesktop.store.combo.Student', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.Student',
     proxy: {             
                type: 'rest',
                url:'/SdnStudent/combo',   
                extraParams: {
                    type: 'TC'                    
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