Ext.define('ExtDesktop.store.UserDegrees', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'ExtDesktop.model.UserDegree',
    controllerLoad: true,
    proxy: {
        type: 'rest',
        url:'/SysUsers/user_degrees',
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