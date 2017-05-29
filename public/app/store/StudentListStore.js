Ext.define('ExtDesktop.store.StudentListStore', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:true,
    controllerLoad:false,
    model: 'ExtDesktop.model.StudentListModel',
    proxy: {
        type: 'rest',
        url:'/SdnStudentMovement/getTypeStudentsList',
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
