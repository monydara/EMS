Ext.define('ExtDesktop.store.CourseWUStore', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:true,
    controllerLoad:false,
    model: 'ExtDesktop.model.Course',
    proxy: {             
        type: 'rest',
        url:'/AcdDegreeSetup/getCourseWU',
       /* extraParams: {
            course_type: 'WU'
        },*/                              
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