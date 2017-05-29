Ext.define('ExtDesktop.store.sdn.StudentListEnrollment', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controllerLoad:false,
    model: 'ExtDesktop.model.sdn.StudentListEnrollment',
    proxy: {
        type: 'rest',
        url:'/tc_class_enrollment',
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
