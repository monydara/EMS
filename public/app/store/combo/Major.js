Ext.define('ExtDesktop.store.combo.Major', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:true,
    model: 'ExtDesktop.model.Major',
    proxy: {
                type: 'rest',
                url:'/AcdMajors/combo',
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
