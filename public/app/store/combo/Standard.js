Ext.define('ExtDesktop.store.combo.Standard', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.Standard',
     proxy: {             
                type: 'rest',
                url:'/AcdStandards/combo',                                
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