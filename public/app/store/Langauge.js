Ext.define('ExtDesktop.store.Langauge', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad: false,
    controller: true,
    model: 'ExtDesktop.model.Langauge',
    proxy: {
                type: 'rest',
                url:'/cfg_langauges',                     
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