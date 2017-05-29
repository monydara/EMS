Ext.define('ExtDesktop.store.acd.TuitionTime', {
    extend: 'Ext.data.Store',
    queryMode: 'remote', 
    autoLoad:false,
    model: 'ExtDesktop.model.acd.TuitionTime',
     proxy: {             
                type: 'rest',
                url:'/acd_terms',  
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