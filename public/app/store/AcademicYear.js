Ext.define('ExtDesktop.store.AcademicYear', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'ExtDesktop.model.AcademicYear',
    proxy: {             
        type: 'rest',
        url:'/cfg_academic_years',                     
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