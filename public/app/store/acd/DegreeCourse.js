Ext.define('ExtDesktop.store.acd.DegreeCourse', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controllerLoad	: false,
    model: 'ExtDesktop.model.acd.DegreeCourse',
    proxy: {
        type: 'rest',
        url:'/CourseRelate/getCourseDegree',
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
