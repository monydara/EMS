Ext.define('ExtDesktop.store.UserLocations', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.UserLocation',
    controllerLoad: true,
    proxy: {
        type: 'rest',
        url:'/SysUsers/UserLocations',
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