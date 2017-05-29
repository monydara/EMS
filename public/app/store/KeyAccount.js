Ext.define('ExtDesktop.store.KeyAccount', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.KeyAccount',
     proxy: {             
                type: 'rest',
                url:'/sdn_acc_key_account',
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