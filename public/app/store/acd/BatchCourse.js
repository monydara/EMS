Ext.define('ExtDesktop.store.acd.BatchCourse', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad	: true,
    model: 'ExtDesktop.model.acd.BatchCourse',
     proxy: {             
                type: 'rest',
                url:'/CourseRelate/getCourseBatch',                                
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