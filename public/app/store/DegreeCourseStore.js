Ext.define('ExtDesktop.store.DegreeCourseStore', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:false,
    model: 'ExtDesktop.model.DegreeCourseModel',
    proxy: {             
        type: 'rest',
        url:'/AcdDegreeSetup/getDegreeCourse',                              
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