Ext.define('ExtDesktop.store.combo.CourseLevel', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,    
    controllerLoad:true,

    model: 'ExtDesktop.model.acd.CourseLevel',
     proxy: {             
                type: 'rest',
                url:'/acd_course_levels',   
                extraParams: {
                    type: 'TC'                    
                },                               
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