Ext.define('ExtDesktop.store.StudentCategory', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:false,
    model: 'ExtDesktop.model.StudentCategory',
    proxy: {             
                type: 'rest',
                url:'/sdn_student_categories',
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
                        Ext.MessageBox.show(
                        {
                            title : 'REMOTE EXCEPTION',
                            msg : operation.getError(),
                            icon : Ext.MessageBox.ERROR,
                            buttons : Ext.Msg.OK
                        });
                    }
                }
    }
});