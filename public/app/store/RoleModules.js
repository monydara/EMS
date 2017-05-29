Ext.define('ExtDesktop.store.RoleModules', {
	extend: 'Ext.data.Store',
    model:  'ExtDesktop.model.RoleModule',
    autoLoad	: false,
    controllerLoad: false,
    queryMode: 'local',
    proxy: {
        type: 'rest',
        url:'/SysRoles/role_modules',
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