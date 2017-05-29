Ext.define('ExtDesktop.store.sdn.SearchStudent', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    //storeId:'searchStudent',
    autoLoad: false,
    model: 'ExtDesktop.model.sdn.SearchStudent',
    proxy: {
        type: 'rest',
       // url: '/sdn_student_requests',
        url: '/SdnStudentRequests/getStudents',

        reader: {
            type: 'json',
            root: 'data',
            successProperty: 'success'
        },
        writer: {
            getRecordData: function(record) {
                return {
                    data: record.data
                };
            }
        },
        listeners: {
            exception: function(proxy, response, operation) {
                Ext.MessageBox.show({
                    title: 'REMOTE EXCEPTION',
                    msg: operation.getError(),
                    icon: Ext.MessageBox.ERROR,
                    buttons: Ext.Msg.OK
                });
            }
        }
    }
});