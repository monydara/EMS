Ext.define('ExtDesktop.store.DiscountTypeS', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    model: 'ExtDesktop.model.DiscountTypeM',
     proxy: {             
                type: 'rest',
                url:'/acc_discount_types',                     
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