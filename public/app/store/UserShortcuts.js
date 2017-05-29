Ext.define('ExtDesktop.store.UserShortcuts', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    model: 'ExtDesktop.model.Shortcut',
    autoLoad: false,
    proxy: {             
                type: 'rest',
                url:'/Security/get_shortcut_by_user_id',
                reader: {
                    type: 'json',
                    root: 'data',
                    successProperty: 'success'
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