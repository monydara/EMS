Ext.define('ExtDesktop.store.combo.CityState', {
    extend: 'Ext.data.Store',
    queryMode: 'remote',
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.sdn.CityState',
    proxy: {
        type: 'rest',
        url:'/SdnCityStates/combo',
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
