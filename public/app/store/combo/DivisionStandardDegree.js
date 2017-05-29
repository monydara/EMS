Ext.define('ExtDesktop.store.combo.DivisionStandardDegree', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controller:true,
    model: 'ExtDesktop.model.Division',
     proxy: {             
                type: 'rest',
                url:'/AcdDivisions/combo_degree_division',   
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