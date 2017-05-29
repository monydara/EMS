Ext.define('ExtDesktop.store.combo.Division', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.Division',
     proxy: {
                type: 'rest',
                url:'/AcdDivisions/combo',
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
