Ext.define('ExtDesktop.store.combo.Term', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    
    model: 'ExtDesktop.model.acd.Term',
     proxy: {
                type: 'rest',
                url:'/AcdTerms/combo',
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
