Ext.define('ExtDesktop.store.combo.Subject', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,    
    controllerLoad:true,
    model: 'ExtDesktop.model.Subject',
     proxy: {             
                type: 'rest',
                url:'/AcdSubjects/combo',   
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