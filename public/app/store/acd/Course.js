Ext.define('ExtDesktop.store.acd.Course', {
    extend: 'Ext.data.Store',
    queryMode: 'remote', 
    autoLoad:false,
    model: 'ExtDesktop.model.Course',
     proxy: {             
                type: 'rest',
                url:'/acd_course',   
                extraParams: {
                    course_type: 'TC'                    
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