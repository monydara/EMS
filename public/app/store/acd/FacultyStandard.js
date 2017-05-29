Ext.define('ExtDesktop.store.acd.FacultyStandard', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    controllerLoad:false,
    fields:[
        "id",
        "standard_id",
        "course_id",
        "degree_id",
        "name"
    ],
     proxy: {
                type: 'rest',
                url:'/CourseRelate/get_faculty_standard',
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
