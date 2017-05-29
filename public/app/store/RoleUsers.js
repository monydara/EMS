Ext.define('ExtDesktop.store.RoleUsers', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.RoleUser',
    controllerLoad: false,
    proxy: {
        type: 'rest',
        url:'/SysRoles/role_users',
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