Ext.define('ExtDesktop.store.combo.DocumentType', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.DocumentType',
     proxy: {             
                type: 'rest',
                url:'/sdn_document_type',                                          
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