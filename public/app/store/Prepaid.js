Ext.define('ExtDesktop.store.Prepaid', {
    extend: 'Ext.data.Store',
    autoLoad:false,
    model: 'ExtDesktop.model.acc.Prepaid',
    proxy: {             
        type: 'rest',
        url:'/acc_pre_payment',
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