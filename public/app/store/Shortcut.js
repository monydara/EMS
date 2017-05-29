Ext.define('ExtDesktop.store.Shortcut', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    model: 'ExtDesktop.model.Shortcut',
    autoLoad: false,
    proxy: {             
                type: 'rest',
                url:'/shortcuts',                     
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