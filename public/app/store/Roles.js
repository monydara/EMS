Ext.define('ExtDesktop.store.Roles', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad: true,
    model: 'ExtDesktop.model.Role',
    proxy: {
        type: 'rest',
        url:'/sys_roles',
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