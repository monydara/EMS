Ext.define('ExtDesktop.store.combo.DiscountItemDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controllerLoad:true,
    model: 'ExtDesktop.model.DiscountItemDetailM',
     proxy: {             
                type: 'rest',
                url:'/AccDiscountItemDetails/combo',                                                
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