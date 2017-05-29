Ext.define('ExtDesktop.store.Menus', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.Menu',
    proxy: {
        type: 'rest',
        url:'/SysRoles/comboMenuByShortcut',
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