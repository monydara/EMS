Ext.define('ExtDesktop.store.sdn.DropType', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.sdn.DropType',
    proxy: {             
                type: 'rest',
                url:'/sdn_drop_types',
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
                        objReturn = Ext.decode(response.responseText);
                        Ext.MessageBox.show(
                        {
                            title : 'REMOTE EXCEPTION', 
                            msg : objReturn.message,
                            icon : Ext.MessageBox.ERROR, 
                            buttons : Ext.Msg.OK
                        });
                    }
                } 
        }
});