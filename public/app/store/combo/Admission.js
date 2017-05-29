Ext.define('ExtDesktop.store.combo.Admission', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:false ,
    model: 'ExtDesktop.model.admission.Admission',
     proxy: {             
                type: 'rest',
                url:'/SdnAdmission/combo',   
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