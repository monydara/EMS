Ext.define('ExtDesktop.store.LevelType', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:true,
    controllerLoad:true,
    model: 'ExtDesktop.model.LevelType',
     proxy: {             
                type: 'rest',
                url:'/acd_tc_level_types',                     
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