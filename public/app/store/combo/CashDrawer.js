Ext.define('ExtDesktop.store.combo.CashDrawer', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad :false,
    controller:true,
    model: 'ExtDesktop.model.acc.comboCashDrawer',
     proxy: {             
                type: 'rest',
                url:'/AccCashDrawerTrans/comboCashDrawer',
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