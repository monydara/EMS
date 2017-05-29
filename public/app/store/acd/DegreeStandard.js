Ext.define('ExtDesktop.store.acd.DegreeStandard', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:false,
    model: 'ExtDesktop.model.acd.DegreeStandard',
     proxy: {             
                type: 'rest',
                url:'/AcdDegrees/getDegreeStandard',                                
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