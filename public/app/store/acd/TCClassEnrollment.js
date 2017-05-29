Ext.define('ExtDesktop.store.acd.TCClassEnrollment', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad: false,
    controllerLoad:true,
    model: 'ExtDesktop.model.acd.TCClassEnrollment',
    proxy: {             
                type: 'rest',
                /*url:'/acd_class_tc', */
                url: 'tc_class_enrollment',
                reader: {
                    type: 'json',
                    root: 'data',                    successProperty: 'success'
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