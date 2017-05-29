Ext.define('ExtDesktop.store.RoleModuleMenus', {
	extend: 'Ext.data.Store',
    model:  'ExtDesktop.model.RoleModuleMenu',
    autoLoad	: false,
    controllerLoad: false,
    queryMode: 'local',
    proxy: {
        type: 'rest',
        url:'/SysRoles/role_module_menus',
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