Ext.define('ExtDesktop.store.sdn.StudentListEnrollmentWU', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controllerLoad:true,
    model: 'ExtDesktop.model.sdn.StudentListEnrollmentWU',
    proxy: {
        type: 'rest',
        url:'/wu_class_enrollment',
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