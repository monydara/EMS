Ext.define('ExtDesktop.store.combo.DiscountItem', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.DiscountItemM',
     proxy: {             
                type: 'rest',
                url:'/AccDiscountItems/combo',                                                
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